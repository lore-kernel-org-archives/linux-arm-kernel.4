Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C660A2601
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W8cdynwh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0G0Ek7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=; b=W8cdynwh39kVaV
	dXJYuC5TxcVJyntNJKvIdI5gjgaNGYOzkbhojc7tEE1TBC46kwvxP2SiIP10c0guA0b4ZJZKNzZk+
	4mEELoM23oJXg4B609VZe7YHM4UzAf+FL8Ho1RsksxlhwitNgi0/F3x6XgbdILQvLH0DoUEKT9ZUH
	kuDnPIwnJg3LPVppVLrB5MjoO45Ev2/XmRKTEQ20dy3+Njam2PomOdQAZpO3Dr12tuYCq9NJtOZLn
	XRcKgDs8kfDcozcVtRpxQq1NrBJsJU+Iqy/QgwoBjuiXQCbmUPPsMydSYOvfiXt5ZbqORdqIH1NTo
	el0EYjIDz4ITe+eQ2brg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIS-00000002EhX-3SNs;
	Tue, 10 Nov 2026 03:13:20 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIO-00000002Eeb-2NoV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:17 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1283554b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280395; x=1794885195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=U0G0Ek7szvfJ5wRGkceIuKWLxgNbCic5fci1WY2/glVHnOibnIW52QVJB5UO7iDqYF
         WF6HQmE6/GspQKxoObT1f36HGr+YnrkRbquEtDj4WQs1goZAR9ckNHHM+KGUD32vO+Uo
         WdEghh7C6p86ygSJynpEf/LPTdRMQvGm9sEdvAPcziCn+/qzItlyfHo+9fR2S0WozY4z
         cTkshKshOUFD7By8MQM7oCTqshjbqTp4IvVwuYWw1rWiIkHwW2jMr8p92BuioEO8KxfR
         i0DTNMfYsZ7UhnRhkCKuQfWiMd3xCMNHlkQcGKqqXqqSgkiMMGhyUPIoDPK4+F60iy+a
         h9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280395; x=1794885195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=MnteHas42EbRlH8mNwsC6FvzdA7HrB1ihVCpuh718j1jWMxGWpv5e+yKkbaHB9Y16E
         6Me52A4E4K+q2FVN1Ei91UR2A/HXA6THKqp1LHrcPdHP3LUNE1PTf4lbdn5jUXR9GpZ6
         uldTfzlRjmBs+CAJ+GrMCX1N0dnxonOIPHRCDfPK6CS/id7pZpSgwfUe4f8boF4/rXsi
         MC8bGJD+czW1JgtlFa2LDFXNZHClzbD066Uw9Wwi6FBkb5ZfnYtN14c7L81xSj7QCsyr
         t9ryDt0NtMHF+DyD0P7Tc4wbaDaAAsolPtpbB0YEe0bEn9C2DPdsgdakQmSKz4w13Z08
         ogSQ==
X-Forwarded-Encrypted: i=1; AL+hErGLZSzGy93VqR3VXsv+y7JGc0YSsurZIB85N12uffGQQpCYeDxaCcbVA0lRR25/tztCowAZxHIj2d0qXW315pJV@lists.infradead.org
X-Gm-Message-State: APuU4Z9QKO8czwMLc0xcbmUsbRVyckH29TGwOs80h50ysHuJMlP23rsv
	V91G4BsG/GQAaWG4ha7JCZA4RGxCtlwXeQhHUMry1QrV/2cKhBPlgqqq
X-Gm-Gg: AYBFou3P7jFmYTn4bBPOW6BQu2/DbTG0/yhS+LOrns8fDWSZ1IzvOAsvc2v/t9ILcqt
	u9j8JF9K5CoFD6kVj8vLkxzVgzAjClbTG5tr1RJ/a6dPcDbMg0r/xnc+uJqs2YJXUJduz9hiYBt
	34/n6hxq3Z+j9b2T+mvyfvmKgOUq7vBfKpoIFrGeGnEJik06uFmkRe9ATD9KfvVAtgt4jp8Mi/1
	ZAsCjDh4jsbjrO9/Sj+x8/KQnzkZF2IYgpDwBPNdbEY6gYZ2wYN1XW8ErmQfKRhWyvVHL4GZn0t
	BEHu/oMupqXa+ggi3ANsCih443JykfZWnm7gLY+s/jc29SvrPBpTDRwqxFIO40aIvNYuK6NCfgY
	l3w4cCjh7mtbZl/Qt9vYidBxi2lL0+drmzJWFZBk9QhWNf7sFuTisHOdfde+LggbO3OJTDamwsZ
	53Pa2I9zCboi41+rIL66OJG7Ve/0QHII1Ljv6EPPUXNkSoXvK6H8HFpFb6b71O1EYxMIsf4ZRLc
	uI4G3xCDKduPyy/S3RiTuNte+kZNxAk5drY4Joe0ONF5MlEIlZc7Va1hKN8Ib4IKeHYUpZXdjwT
	QSh7UrajrF8mzn2gYdsPoSTay39ASdSSe4ePyOA+adXuqbFxzYyZxE+OFpb5jsQJHYaBzv3YR1+
	KIVYSsxTzJnYM7oGGfIw1whwaE/pTOJLhNBmL3q8Mn4LhoV8teXj+ENBiqiuIr66cm9QvIX5qhj
	5CTkfX16Sn9H4f7s/iKFLH1z41zgQGiPTnjD/WjaO7UOo9pKN0hwgu3tXCdyV5b5ViyIRTzOjTd
	g==
X-Received: by 2002:a05:6808:3089:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-5688127ca80mr655733b6e.31.1794280395471;
        Mon, 09 Nov 2026 19:13:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:52 -0700
Subject: [PATCH v9 03/11] serial: 8250: widen RX trigger byte counts to 16
 bits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-3-3f03961dae8a@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_191316_630175_47EFA22D 
X-CRM114-Status: GOOD (  15.34  )
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

DesignWare UARTs can have 2048-byte FIFOs, with receive thresholds as
large as 2046 bytes. The byte-sized threshold tables, setter argument and
sysfs parser cannot represent these values.

Use u16 for the threshold tables and byte counts throughout the 8250
conversion and sysfs paths, including the uart_port callback interface.
Keep the FCR encoding byte-sized and preserve the existing threshold
selection. The Moxa setter continues to validate against its 128-byte
FIFO before writing the byte-sized trigger register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h        |  2 +-
 drivers/tty/serial/8250/8250_mxpcie.c |  2 +-
 drivers/tty/serial/8250/8250_port.c   | 12 ++++++------
 include/linux/serial_core.h           |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..939b7d4209f1 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -69,7 +69,7 @@ struct serial8250_config {
 	unsigned short	fifo_size;
 	unsigned short	tx_loadsz;
 	unsigned char	fcr;
-	unsigned char	rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
+	u16		rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 	unsigned int	flags;
 };
 
diff --git a/drivers/tty/serial/8250/8250_mxpcie.c b/drivers/tty/serial/8250/8250_mxpcie.c
index 4935a5d1c1a3..4f0b881b4f83 100644
--- a/drivers/tty/serial/8250/8250_mxpcie.c
+++ b/drivers/tty/serial/8250/8250_mxpcie.c
@@ -257,7 +257,7 @@ static int mxpcie8250_get_rxtrig(struct uart_port *port)
 	return serial_port_in(port, MOXA_PUART_RTL);
 }
 
-static int mxpcie8250_set_rxtrig(struct uart_port *port, unsigned char bytes)
+static int mxpcie8250_set_rxtrig(struct uart_port *port, u16 bytes)
 {
 	struct mxpcie8250 *priv = dev_get_drvdata(port->dev);
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..452851815ffc 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3008,14 +3008,14 @@ static int serial8250_request_port(struct uart_port *port)
 static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	unsigned char bytes;
+	u16 bytes;
 
 	bytes = conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
 
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
@@ -3073,7 +3073,7 @@ static ssize_t rx_trig_bytes_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", rxtrig_bytes);
 }
 
-static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
@@ -3094,7 +3094,7 @@ static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
 	return 0;
 }
 
-static int do_serial8250_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_serial8250_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	int ret;
 
@@ -3111,13 +3111,13 @@ static ssize_t rx_trig_bytes_store(struct device *dev,
 	struct tty_port *port = dev_get_drvdata(dev);
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
-	unsigned char bytes;
+	u16 bytes;
 	int ret;
 
 	if (!count)
 		return -EINVAL;
 
-	ret = kstrtou8(buf, 10, &bytes);
+	ret = kstrtou16(buf, 10, &bytes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..97301ef66af0 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -461,7 +461,7 @@ struct uart_port {
 					       unsigned int quot,
 					       unsigned int quot_frac);
 	int			(*get_rxtrig)(struct uart_port *port);
-	int			(*set_rxtrig)(struct uart_port *port, unsigned char bytes);
+	int			(*set_rxtrig)(struct uart_port *port, u16 bytes);
 	int			(*startup)(struct uart_port *port);
 	void			(*shutdown)(struct uart_port *port);
 	void			(*throttle)(struct uart_port *port);

-- 
2.53.0


