Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CA0606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OpllRXxB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3ebqF9F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=; b=OpllRXxBB1Ett+
	DR3H1B/iNc0rmAcc3RSqCXQGr9WiPURHOEvlSV9G9HGqEZ7d2SJWaM+/8GE2Mf7BFXnGY3bVR3S5u
	2D8n9SbuCssO1/7v7/Ub6S4d4hufxdast/D8WrbQO7671n4qFjRfWXOJjlcjZHikNb940ZmcnNYIA
	9m/U+D+c4W6rLYX2rabyKiL3AmHJQfIQPbmderb9BvxjA5Oe73trEDwKVI6Yq75VFVjzZNmapumw1
	3l+vnIqKR1MymJlhZ8dp51iD4wNeqOqARN+vHU6ndsMzv5AdPOMf3lS7mW9isvIww/xZePKVxUxHs
	On/fv4yZzQvhSW70rv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXW-00000007m25-17bw;
	Wed, 18 Nov 2026 05:49:02 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWx-00000007lbS-43YU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:29 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-38190551625so1193974eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980907; x=1795585707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=G3ebqF9F3rTKY0E8XN15kbNcRz3TweZ53HVQNUMup80zk8iEJMf4bJFI1c2Ggh5bU3
         7XsCQ2Q4796DxVneFXiGKicsiqXLvpBuOXz7c1E8C1sFyeKjoUyt2vb+4nasXcb52YaQ
         hhueIz414bNDTwkcdu1zhZmyWczdgmUxVT0/dc8dpiSuDWnkWk7FQM7HJLiCiFOQumzz
         EEwS8hI2MknPoKcCOIC3BfyKjR4GBMWXdPSMtPGwXLAQ8o9XjbgdNHsjtOjyBSxbh68K
         bZ9p/2r/6b1PE7FJcCnOjvX4BWfegLVCRepmkAKvOOvuKGi9Zk8ii8L+slwTgnazgHCY
         2oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980907; x=1795585707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=VcjMdU6mwJdgJfA/vjO5CNmBEwe38VRXaKpJYYqcl6zndQjZ6Ju/Vd1CoGiseqWvif
         zwoEzMGOwT5misl792AX6T5id061CLG1pQqJHbnjqXUg97LtBkiPa2wH8PztJOxwXt22
         YWYpDbh3F640OxN8eNXs3nqIndgAlx6PLnK/tsyTcuSwyxzeenAMSIPk0oTxoSw5ZX6O
         ZbqAX/i9rPd+qTECip157TFxMuj6a3Y/H5FBoO8j2lMYe9D1GV2BV5TWiPigdHII70aN
         8k35HnHV1AfUd6M4xqm5vy15XfbtRL/7YUPrCFghCy07sBXuPwPKO6DN+jMpqqn/L7v1
         w+iA==
X-Forwarded-Encrypted: i=1; AL+hErFyY9asGxzq7MqK1mv3EJI1uRwhJqU+gUF+UFnyMkiWQG4JxbyBPl/iTozB8KNsdMuvEhL4YpM160lUW32JfpFt@lists.infradead.org
X-Gm-Message-State: APuU4Z8/2unzlO9i5vrNPmSQy6F5YW5285+spZsLtnJ1Wcfk0fzdPRLN
	hvZozTiJ9unCSN08aoj7I/vUqvHKXQ2mCRxd0L7dqmNKnXZj+S3d6cnuYJ2ILg==
X-Gm-Gg: AZFdTZersJkhVOstNnJznelZ64pcM99AfGsQx7JI4HgJefcKXAaEvYI6bnLpq+MbQi+
	wV4tGgGDqmP8iGBAxpdDPUYOCRDf4mKSIjoSYcedR4DF6nLpt0M9mhOr0VnrcPR1NWUGLJmZjfR
	l8QF5WjCVkDqS0CgLJChGi56enL8O4/Gw2rX9Up3G0GL44n+8Rlyh2Ee863w6oIhaRviBFBumuj
	ryr3Tulkf0VUfao7kUvsFtZICjzEKokVESG6pB4HTqBDFY1ncO1EhtlzdO4Iz2WY/zC87o35E2U
	vUQq+IZmui22dYwWxIeO8Cx9qypGL7J8p9kEbQ7MvJpyloHuIvzB0GlRs6oySNLjIfem928q+K5
	bgp329UYQ+xbFQgtOe62CqZBOmCynTtSPc7w81C5589eXxXMOnZt3SR0X47ouifKkkC2bxAIwfe
	NTfoJ+cZUEYP6P3H53d0dQlXzq0idxzbHplyUlJMijmgEVlJ0wXqwaDBInNqOoXGlPuPLB4VTOC
	3PLb0WqU4WeJIxy07/o11Ul//WyO9598LJI6PxNZVOg1yk8JYF0sVb9cNce3SWXK9xHxnBG3Uwl
	ztIg2Q5O4co7B0Ikbgy2Y0ud9OQ05GDG0WNtG8m7dd8DUQcz2qOobianD1HKQvq7DYUbYQRCH8R
	LpK8kcEHik2BRL1ODEYqpquqU+Y+d6RJieZm9YO4sLfkzbd5Q/dWbnyr481+Sos9oF8JagfJEXy
	8MnA==
X-Received: by 2002:a05:7300:1c9c:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-3827f9911d9mr1687099eec.6.1794980907375;
        Tue, 17 Nov 2026 21:48:27 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:26 -0800 (PST)
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
Subject: [PATCH 07/17] ARM: dts: BCM5301X: phicomm-k3: add nvram node
Date: Tue, 17 Nov 2026 21:47:48 -0800
Message-ID: <20261118054758.132233-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214828_032753_B91E37C5 
X-CRM114-Status: GOOD (  11.06  )
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

Add it and set the MAC address for gmac2, to avoid having to handle it in
userspace.

The nvram size was taken from a boot log posted online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index bb1bc4e61bc2..5b9250976f13 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -28,6 +28,15 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x100000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
 };
 
 &uart1 {
@@ -38,6 +47,11 @@ &usb3_phy {
 	status = "okay";
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1


