Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704E606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbXK97hP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJWyABjV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=; b=qbXK97hP/6UGB4
	OYzCtGvPY5HjOrpLTTL0YlU9POY2PajTKyAHaBckUN9CWxxZs44vStKJMNmUI+iP0Amp+GcJsNboc
	nZxiaMpwBFVSCRdCXJX9YDBFQD/kla0iFy4JdjX9oy67VTvfLDUUYQD5iRdY2jk/Tir4m6l9c8Rx3
	f2HpVC1HDtNfLfOcC0sXlCffHSLwgGTY64AU2umSMKRmD4c02JMkDga2f9+tEkrxOXYJ5c2nPqmuR
	aR735aXf+mxfj3YjfPSGMa9VGevwXbBJpVEtIpJMo/fxaB8XpbmG3h8jbEp7vKTBxWtJbRtO/GUR9
	tLKsUXWtGcepgYQHOZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWz-00000007ldM-0oHB;
	Wed, 18 Nov 2026 05:48:29 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWv-00000007laB-1f2N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:26 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso225617eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980905; x=1795585705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=xJWyABjVDY2pBdeJo2ln6CJV5ioIgc7aHH7jc1nvOBW70URsPM9UijNlaAhHulhkqC
         q+EIBb/uV2adK72fs28KA4BCyzR2mtvxPs9uNmlubSoRd9Nr29TPjlcVSkB8p5QAGRW2
         uwTG9Q9WcY5Xi6Ol74moMsG8Gm/dLdnPWWrsWbeBLRGkPfjHm+3SGXBxhTV9PGopDkx4
         vP/yl1UtBZXgTFaAGNbaojwo00GGe98nWS8zyuelrgAklVUED+3YOLfsOwlDhGyS1xII
         +CBhfHsM8fMhlf9gQI9xYeU62pqIGSuVdjPICdHFhbcY7orGpy4HzA1eyUgs5KXFt3ah
         9IMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980905; x=1795585705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=neO7DNdBOate/uQC5g2hc/m3+De2zEOtrkHnr8bqMvmVpYaHgeF6cnH2I7ka30Ql4B
         1Ffmkcqd+4bbyBa4KrTxaUyQOBB+XL0T/h9rLJH4VTWrpobccGDAAbhuK1lP03Kg85tG
         atx5EzGJhrRxd3OEf2hyMoiNOMfWzm8rRSIvGAFz8iWldAcqp05YmoVYVSIiCNcus7LB
         Bz0Kw3ajiMqsa+FcQwBQ3QTxA7PiNFBgoSt+aIS5jkUKQo/fkaCjSR52TP3Bk55UMp+Q
         GJSO9dYk/bd1PwgM+/L0dCuFi5ysqNr3VBqivDTQB7eaETRHzHUCh5B96himJCO5iWfY
         WYxg==
X-Forwarded-Encrypted: i=1; AL+hErHNGnlAjd0Tp4zLDYba5t6BqgG/trMJUDyKVjtWkzaKOqFvHnozaCSk1j0Hu8/q15Y02//WmiD9rezx4YnOajLz@lists.infradead.org
X-Gm-Message-State: APuU4Z/7WN3eR4rJXrwif67/Oe5weMEVKS1Qqhyvu4LgrweyhmRAgfAy
	9ougIK/hHj+LLPpLuGlN1dmLs1EDzLaHDFtvV406tEzfCYtn7iDD9b0r4TIRfA==
X-Gm-Gg: AZFdTZfFpCprUtD47cIpP/ZPLIVTHL64RuJ9cVdIC56KNWCV3rtf+DAFFqqgRifGK+y
	ebdv3Wm7y1b07DaTXjejR5v1GIlB+ZdqP3dhqvAOrYf61HIQb4Xm4ga5B4jki/ItFK1lVkLnb4F
	BHEdEvi6iybw0vg9ppIU7zQoZs0wF+qxZTD7zD8CnMmWr6Vdq3mIiB3NyS0vtD84Hg1D+tRIjlq
	skEj8Wx+FFl9OVtBXZFMN/b4HmEhLhKW9rTtIyFgviStyiF50Wh6VjoMF7GJhSPADAl6ehbDhWW
	OKteXrwJli3WksCFWnJkzcpUCRbEVfxk2v9yprs5XjBP/s+hJDFJ48sWbYO1hK13qqdkM5xvIEk
	OcEog5KVMqQ0M7biXMJc9tkcNP8sIRx+/p5KXkW/IutB5ySPSfD72UJGS463XAGl5uAG42mQVLM
	2/ESzFT9SMtrEKp2XcwGkITM5fVi8JFrBfCF6wzm/8pu1iAAnO7OVYvfZeFCei+s28vGD8YFd+/
	fxQB0YJrGlHzhMjiUlWHK96MD57r7blpWqTrHroXSk/x/16Mwl+WXV7F2DPZhCODbR7xaJgVlyJ
	E6A7VhHYnAjPQq8tARtQUvmUzkzmFxYtbAMjvztlrXKfGyPmsdWKy51Q9EH+91A/77YVLkPLzpJ
	mspxxCyGyHj6Q3kokKZQcMOmYEn1CPMFA64jQy3kpe3/YwqjjPy84O0pkMAEJMFHmil/nvKQkDo
	KOXZJVUjszhuOyBzWzs+Hsdlk=
X-Received: by 2002:a05:7300:7b1e:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-3810e418910mr4614737eec.5.1794980904748;
        Tue, 17 Nov 2026 21:48:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:24 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 05/17] ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
Date: Tue, 17 Nov 2026 21:47:46 -0800
Message-ID: <20261118054758.132233-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214825_435844_8E548E5F 
X-CRM114-Status: GOOD (  11.31  )
X-Spam-Score: -2.1 (--)
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

Describe the et0macaddr nvram cell and assign it to gmac2, so the MAC
address doesn't have to be set from userspace.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..f8dd08cc7cca 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -24,6 +24,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -50,3 +54,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1


