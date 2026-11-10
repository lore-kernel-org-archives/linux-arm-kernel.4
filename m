Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649660A3810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGUnSOKd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJCyo2Br
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=; b=tGUnSOKdNOuX/w
	llFzXDulLSyxdoVi2eGqK+kaOgoIbgnP9SRMXbC2JLWCFEU3IfzE5FQ0isZH3ivZxIWcSISKSK8c7
	hj0VTX13b4hi5Dh6z3gOx9DWDU9wwGOkEE/fj4tRYmxHm58svuzjmwCpfkWMCn0vQrGARIcFsPLxe
	JRm666ADxJan+XqsHcZ1BRKlUSwt0hSKjJ3qVDlsKGxjNXleaPyIxWkMFXTgXQuJ9Gcf3y5m3f/fL
	3mSVlgqkDpM/QWkyhmle4WpQR6feq/LkG6KgZ9qJJLxoHeeUjfbbO8k5KjtsMTnYBEmnVh2Njoc2s
	p2EJEYMYuGI6EyE1BnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIb-00000002EoA-1OcZ;
	Tue, 10 Nov 2026 03:13:29 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIQ-00000002EgD-2oQQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:20 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-53a448f86e0so822843b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280398; x=1794885198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=rJCyo2BrXsayybjfsfk3wKGP0hZdAxcwMtDxSqfIlh28kzl8wFsDQ1uTZkAYkGI3Nc
         pNL2gtsPFg6dC8Dk2GU7AQoxc6p4CVhcWYdELKGVXf/dUR3dyvP4cExpjZ9jQZKnyHFo
         rXea4XE9zoAxT49rbo9Hvu5U5cVoNndGO0UZqlfsv+MrxYuQfbdDKhLJKMTub9awUMWM
         NS3EeL6SejkVGnFW9TGRlXsHQIUO+lKQPYnYjwizmeoYY/as0iPHvacRmeIigpLGXyxe
         IyHVTDXjAPklFY8ocyCZWl1X2A65yvVu2ngQGW8kx4RyES3kLBObNXnmTSUjr+gzps8A
         tiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280398; x=1794885198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=M+uCC14Yh3kx+w0h/iJ/N3XTXkoioizFAhz/tcDKB8OXmaK81Mlsl94zu5hEP1IJB5
         +XYrpdmOMVJspShbUnC/qLuE3L+VZY5EgSWTaa2quBnhirXd4yA7LykrA7qyWmCVSksP
         D1VLw4ZdKojhLRLNUcHHtUMUeDawDzZMwP3td5kV1R6SdxxUuRqVvo/OMN5miW4myibP
         lAgIw9SR/6mH25gNc0FH5abA1JZX59aE13ADjdKfaQmyKMlQ7vgPoF1fc7jQOvcePvk1
         x4NdoWX8RIKfsWYlaqBxgX+wxCkQK7YaxeoL+B2DLmgx0P9f6eIbiRECnvZg5t0CLsTk
         raOw==
X-Forwarded-Encrypted: i=1; AL+hErGb34o7elsvewXq1ei/vnDw/jxF8BF/rghc1l7+zWeM0XjVulwtY1HuttRhjR80Ij7pvX2Cu15ge5DmD1PGsgVC@lists.infradead.org
X-Gm-Message-State: APuU4Z89bo9THNYHU69CC2Fwz2KNLGA3AcEd5QM7AJ9E9+e0lHdNYRK9
	T+oCZcUXzCtzEf1B0rngN31rWuxdlzwc35fgWL94Ai8EdJjXJwkQBwMc
X-Gm-Gg: AYBFou0wZir0CpbemWCXKrYguTKCS88tmqh/BxPOTJXOujE9eSKY6xvxi+A+JULmPlA
	/NI3nunexv5zw+SlX+XyMzRrhloynuUhUZ0DS1nc31yitVvTJKQkwHFNNvq/Men75bzGqr2+sTJ
	QL4ajyGWRJYzA1LHoTF/3k3EBnJaq4HgAi81ry/17D4b/RFzgWubYS7FefxGabdchzNVgB5d0a4
	FWS30Usfm+M4Ou7EF+dKSNp++BA5cNxrve5xkUKSzQOhLKtsugt+ywQ2FLS/yQcXmOOA4+44VWK
	1UxX3LtYc83a49LFgzKPlme9KA4oWFcKXTg+uUv96xa92uCQHbiClbaVD2uCwt/mKNxdQOeMpvq
	o3KCuLZjUzUwwSU2SV5nWrI4aEQunphYkkVxO+OV8IZrYjNmPdgt4zWA1/GHrMc8ZFih47vMtpD
	0nPKMBnss5+K81r+rUZiFKeUp57i9SpvFNjW/kK6jxWfgfmzrAYbGNwsZHwW1IqOfXU7744vPIl
	qw17y1pTKN4Jm6O9Iim6QIC11PfbS2MIQIDwHghUkliWR5tEbthvzeJMn5tTCF8HKPLxBJYvgaA
	fCtlMN28VWbD3A1MryNYG9gMObRZn49rGsDzdcu3DUNZLFzrJli1iaT4n7TFMbR4ZjMhkiW2VHR
	vkSO+wibTtoAYDmakxeYCNDqjBlu1vA3QPbrRw0/yOdjDWOc4CievfkMKAnzeSc0nNjW0+ol7jX
	MCLM1Yasuf609ApCYPAMDT5G/GPlKZUmPj7KTnFDT6mqYJsAVLsb0+sTXBAKbFElWUIVVDvQigE
	A==
X-Received: by 2002:a05:6808:3c48:b0:568:2e:531e with SMTP id 5614622812f47-5683cdcd52amr1079208b6e.59.1794280397927;
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:54 -0700
Subject: [PATCH v9 05/11] serial: 8250: expose RX trigger controls for
 custom callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-5-3f03961dae8a@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_191319_485585_C5C2D6DD 
X-CRM114-Status: GOOD (  14.37  )
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

The rx_trig_bytes attribute dispatches to a port's get_rxtrig and
set_rxtrig callbacks when present, but the attribute group is registered
only when the port type has a static receive-trigger table.

Allow a port that supplies both callbacks to expose the attribute without
a static table. This lets integrations such as Octeon provide their
FIFO-relative thresholds through callbacks while retaining their existing
port type. Require both callbacks because the attribute is read/write;
ports with a static table continue to use the existing fallback handlers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 73bc9e7ab703..d87e2b852c3c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3152,7 +3152,8 @@ static void register_dev_spec_attr_grp(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 
-	if (conf_type->rxtrig_bytes[0])
+	if (conf_type->rxtrig_bytes[0] ||
+	    (up->port.get_rxtrig && up->port.set_rxtrig))
 		up->port.attr_group = &serial8250_dev_attr_group;
 }
 

-- 
2.53.0


