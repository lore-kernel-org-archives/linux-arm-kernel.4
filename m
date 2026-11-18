Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B29606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c8ZdVrNM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOzp7E7F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=; b=c8ZdVrNMNzsZrK
	MrSg1UVPFvVMdNW6P2BOmfyLPajmL7FoopR/b82z05HVmUf/l/y5KTdMsxRKfdCc3qDnDqTPHRs0c
	KPKjkK7lAOKSdFz8HvlNQnWHdZw5Lsi2k5K3+uAPUeKKVuKvbanlA8dKZc0+nfxfRZnzyUMbZWLIJ
	V+YHkxTq+NqeYkxt0bPuaHUGjTBlFC/ySF+g/ywMMajR1x2S8pTHUW8GrlB7kZa6PtCMiGjiU8Tg1
	IsxOPv2ZTJGkps84aQ2Vz5jTWBY6MwJdX0wZR3A2ouaKkXulF2WS4q/JFPi0lGhJ874/cZmjg8Nx5
	iOJVY3JN60vAW443I0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWz-00000007lea-362C;
	Wed, 18 Nov 2026 05:48:29 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWw-00000007lap-3RWM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:27 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-380b40319bdso1048046eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980906; x=1795585706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=MOzp7E7F+DajFcuMaxdW4JYAnAV45HwNQ0aHa8qd8RiMCqrKFa6puHe2PpU5ZFzCFg
         8LpyMqkinUluaS7X4N2rWZLZQ2+a00CUnyBIsLqe6E3ecA+d46wGcY2j+hTxKmMypcMw
         MKmwpjsSfckVYoFpxF6rIIrZ088RocE6S7ZmusBtjmvyTNnoodW3hyPnpiRLRSO4kYJE
         pJfCb8oq62fW3l/6CWeRg6XBh8bVy2mE8V5ZlPiyqQD3ixOD8lMID9EscUQDYmKIFrX+
         JGnpCtk5ZMbrwKUTA9Ur0c7HAUuTFYVviLpnF/bnsw/e0Z6qEs8PNGZQa9NXjdw7IvWC
         KCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980906; x=1795585706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=vjqSocXscaUknqY849/SvDgqFQJa3QgkzBIiunG8up8cDhfzaMSdw+AbBUU1jrCo/1
         7FWun7cwTasv0Q/Tfk5x7VLtHe5Tzrk8aiP4JbVriOZf5sRFCzDvKrIbM2SRz654pt/f
         G9TwiwBZbKKAqJwX7c1uJe0sE16yiyb6oXab/T7ZNP2RJl9sn9DkiR334VDO7aX1XpEx
         6yEWcBVskeWglEj33GreC6XIsdlrsfHM9RLJqq+KGWtnqxOrtaPBtXHKvbmEj8S8xsdl
         WjovrC1JAfmM8dA9MCBJYAmylqgAN9MarKq2nPmkGRGhFk4OQC19IQ4UwxBU9Q9oKYix
         c8sg==
X-Forwarded-Encrypted: i=1; AL+hErH4f/j9xXqJoVdLfenFrv7BxPXfb6s+2ZkhyXeuTAz+/Hjk69cVddLuCx92IHvx9hlxNUTMByEDA1pa5z3ytACI@lists.infradead.org
X-Gm-Message-State: APuU4Z+We/fzWqSVpYpieIDKebXLVX/4j5ms0/qhk4H/nkzlpzRiKMZY
	wlnW9QNN+XDse+EwtK8K47SerIkMFGO9gVdZbHXrkJaS7IkV3urWjQKH
X-Gm-Gg: AZFdTZdrZfZSi0M8fPCN4CiD96k/suRimZmGnqdeFb/vJcz2Tb56xMHQ/dD7GUwIDOk
	oeTF3u1bTWRy+d0rzFKtgVS24hwfeoIlT3OM8uVpYl4NTww3hSm3UI9Zsf6tysjfOXqdgdVizTv
	ZAaMkH0JRjbkTbOKePjG/LteMdR3DAzWIM4HWR+7LnocYKSZLUrxfJZl92BNwtGxmS22aGUcpxZ
	mqpE7Tl9G9Y/KaGYaO/7Cd8V49TF5CP8C9dV3WOTG5nadTwXq/KjEOxfK+XDgr9nRzDIZVPds57
	KzNMLiYMuUKNS87TzNum5LmHOtSUQV7jcn9ZawHeEkraUn3oeQoJJYB2KcSvoiirb1QQMKdsmS5
	PD4HPauwjw5mw6ZKto0gKGPY7Ds+cqR6wdKCwcCp1Rv98rlFpx1BGun4cNIUP84vTQ4GOoWKMAg
	X9XUKZtk9jnu95Ff5UCuZ86XzVsrZ3oQg6E3Y1mEa2s9ZXF1kPBoXSOoOke8YICOF2OyFbIbcTx
	Zfwf2FtbuDTXhU9nNmz1JqQ5wOSzs193OK40eqblyaHnBA0nn5BWMORa2UyoGUJ87xJ5W7PJHQ7
	1GTxE0NcIQMHWqvQ9EP1S7Bv7Vri1QWsVHw80q59izM1+g0RkZ8xCXvyLdYuVDQOtqhgr9EGRJ9
	qSb8eQ7r6MkTjSqXoEBEIlA0msbgCegDlzZOzt0cJeFMA7Tp9+6FCHnMCTIFQIgvzArXkpNlYRh
	6w6g==
X-Received: by 2002:a05:693c:8344:b0:370:121a:b2f with SMTP id 5a478bee46e88-3827f98b7a1mr1675613eec.11.1794980906022;
        Tue, 17 Nov 2026 21:48:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:25 -0800 (PST)
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
Subject: [PATCH 06/17] ARM: dts: BCM5301X: EA6300: specify switch
Date: Tue, 17 Nov 2026 21:47:47 -0800
Message-ID: <20261118054758.132233-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214826_889602_9247026B 
X-CRM114-Status: GOOD (  10.32  )
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

bcm-ns.dtsi specifies a default layout that is not correct for the
EA6300. Also allows setting the WAN MAC address properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index f8dd08cc7cca..bca4c440a499 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -59,3 +59,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


