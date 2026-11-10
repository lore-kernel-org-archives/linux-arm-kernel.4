Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07460A380D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ib/EKThl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3ZYiDrQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=; b=ib/EKThlRBNDKH
	3+tKRM0cmVHkDgkJFDVPlMNBqIP0IwbW1EH5/x58AOlIMirypZC9jIczcu7Ye04lqAD6LobIK5krq
	WhhAOxAHZnYArC6qSY5xH4TduMu5H6iguWL2nb9oLJPKoHHiD7KpX4HV1bUVlOYeSGRgLeoDFPjMT
	KvkhQGl5mMdIhfiRZT8Mz6aQwcQNWW7dHOLOcLIXhLgty77dDRz7ckQPGumN9AHFAjXbKaW0Xlnn4
	kK+CNHHbYkd+ElpaZCtTu/wgBPSpyLDtf1V3chTPsj5NEIB3TUteY+R9SuegyS+8jX6Iy7cC1wOXY
	r9iI07qTQTLW6sVpFMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIb-00000002Eno-0tRQ;
	Tue, 10 Nov 2026 03:13:29 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIP-00000002EfY-3sKC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:19 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-5642e0910a3so647275b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280397; x=1794885197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=e3ZYiDrQga57PvTm4IvLxLWjkProl8lPjrynAWaEfxBf8HTPV1f8bTJ0zfKSgrixIT
         H+ERB2sOMkaJvninfT5sPRuR/mx6eMqQevAplsHWJ2UlJ69HbwXX63hLEyjlXilAmKDd
         HBpfNTqXjju3zfrkOGAm67MANMzNjUR3QkQfjm8P6zWXfpI/QSZ5bG+IsKJ9WExNDb8C
         9FQvezYcjc8EFpGxzm5mVQn9IXUsvvTYiH24iFtASC+1CQSwYG4Jk4tPfUGLPWu4iGfJ
         r7pIjXo2siyX7R+EcgOo/039CmYr2cwsLP1u6clcO77f0eLxAyd0kN7jf2arcP1bPFIX
         eixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280397; x=1794885197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=uvKfzd1FGKa/3xVtm/C6P79fXQVErmekRJj7Ucz4RzB6Pq1DRwNwXk9wzX0GSVP7vq
         nKLbeBqwFVQkEgaUx0zj3MkluQ5DBO87ySX1q2wz1jshQXfyAT+B9uz4r63ucP80u1/c
         c4XNiul9MXZg47n6Vs9UVh3a2LcMronW27bTMekhLX4TOBRL+vPKAzSJbQCuF6Syt9gy
         ak+oh7l9RiUU9hhkP77VLCcyCEkH4W6J10+oCT7tAYwTxQxmq989wcTsGO9k6tWOHzOU
         hjKWpH31xbHtYIoh0NhbGvaDnGZVqoo2D/UK3tbTQSGTZ5dsE6qZkxz/xBAVbRGvJ98Q
         MHnA==
X-Forwarded-Encrypted: i=1; AL+hErHBXPg69mqygtFen4SzHwYVNHWxAJbdg/JQflxvvSL8KRy03ZdpXeaCPJwYHxRm47ZWgI5onZywO3dBtH6XnNmE@lists.infradead.org
X-Gm-Message-State: APuU4Z85Ie+TB0p8Gf2oG9Iar/ZSXKKEbZP3f5uQmIKq3cbQTebuiwoS
	Yqlv/cW/wZKHh49pjJdN5Fe18aqieAuVIj6q/ltGTyShSh8Ys+GbAZpa
X-Gm-Gg: AYBFou1ktGIj/iEh6txwI2MOKILYfdXfi/ODLGN+HxlYtwnhzqQEl9N1VvsgH1FjMR/
	40HPcfETMqrNq6YogkVCd1illeRb9b7F2U6Y8yJXHgFxZ0f0lycG7GbyvEJWSnr0sRBRBiAF1+h
	YzTvXqgdA+K572htsw83rF7jfAMcep33uBtJQ+wTpnMZNUglgH3xtQhHwo5uc05QHVY5/QvlURo
	Qy+uJonVnSVv05OH003uiqmlLvYIiLznCiqlkR+yXLyMTMaoJhBrH5Q0fAwgNSIyL0V6elZJAG8
	21a08qa5bY6cge4RBS320GIhyy93SQz6vs+sYdz2SkTdSM1EdKt4q9Wlf0b3ycwlSKlBaTJbFyx
	BoXjz/S0aZ2DM53yJEkk0oGYwOpUJu1cZrpn+QIPijeW7yszJw3oS6RY/TU9KsHX7+/fNRqjVkP
	d1qmnzpUlDOL8S1gZyS4q/rOKliBcunHKloJIg3zAwlD9qHBorIoCY86d6cKE+9HuvxF4NMP4L7
	tLNtfHOcHM3WJQmf/MspBB75KBuj4R66QA7KXRf0xEdIZcghLnas610COKaTTIDMcLnxIfs8mT+
	+uNoj2iz9y7zQv4m/01cSYRZlQCkkfTTkpYnqjj2k1rFFDOB7zWj8NiHRsBB9iEZWZt//wUP7/L
	tzRhIS6R7gBZuD+aNlrgSKg57f3OxRGPDySab9hqfck7BsySzIWfhhbhxgLC+MF+rsy70gps9ed
	D+fxn+PB1/kogGP6vylHNuKGBAKxbjIGv796pt6YwcbZRGtLXembSx
X-Received: by 2002:a05:6808:1787:b0:564:347c:5a7c with SMTP id 5614622812f47-5683cd801f3mr1322272b6e.59.1794280396724;
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:53 -0700
Subject: [PATCH v9 04/11] serial: 8250: share the RX trigger conversion
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-4-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191317_989562_64DEAFEF 
X-CRM114-Status: GOOD (  15.24  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0


