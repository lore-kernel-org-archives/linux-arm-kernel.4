Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904EA606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jLE/ArXp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT/7tsqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=; b=jLE/ArXpfAPA7R
	OZkx5kNmttQUuYyjtcqDx8KR5y/wrhQ7T99qCopVX5O19SsWygdT7SUtLwy7Yit41Sziwq/LtUppK
	nFNeT2JC1BzaEMcn4kVo8FPeXEvisr+HuxISVxob5mZ70axsf6JGYd89Aflm4zwwD2jmakiVh2j1d
	feie9K8XO2B0VA+7y5wuORBYgVgrGH4mdP3IKk/5D1e375d3GLmgfl++CV+rcf3jbLqUOHLZ0USvV
	Vz8rfCiY/d0Er/YJcBgGWe+9uffDHvkllbDhUVn/zuwcXVWgOSub2Z6mZU2DbR3ihFLZZqZdXGPwt
	lfXvCbC05jRMLO6ptRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWy-00000007lcU-3Ylz;
	Wed, 18 Nov 2026 05:48:28 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWs-00000007lYr-3pnr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:24 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-37198ed3727so2042646eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980902; x=1795585702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=DT/7tsqNyTDPRBOSJskNxP/4AI1s2dIgL/OxJLeH1sm2yAwQ7r+ZeKgDOvfbqJUu7z
         ZyvCWGskzYBCoeEHLFAgw73gX6WdMzAa5Ul/ARRpDqj8ym38MrcqMeSGpiJseI8aaaKn
         Yc3okL3NrqntYq8wNqjF16m95JkOhY7ZDYCA6zVA/Y3mMmlkA5clkuBsQDUiBFe4vMGh
         5i5WDTJ/Tkq3CvcbvJu4yEmahQTxwm/eOgqGTXYkud+6lUBBc9+fql4dKiS/jWI2uFjg
         y2LpmWv1SFfLa2yXlOettUyisewxACfH3goFMpJS1T/tXAYAsA+inswgTVv0xEQLWFU2
         jF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980902; x=1795585702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=OVUJLJ9jr769JzZDBFMuJp1iYVWl2/VUAZFckzZCHVFgPsjZx3ERUk6q2I/MyVm2Zv
         23F4rbkOiBUnis45XhybdBagMEeYrwT+9SLtK1O1QAZsXYmbKHOM32JZKjzRkWVzXU+W
         k+Y0hnrMhHFIQbdorkO9UFwOj8Wn5epnIPN0SeFYm1/NhJGfREsPVfDiNcqCJFEf4Rna
         p4y70pNvWHNzBQTQbfDmh2SwpcctiIMTKZwzl05X0/uj5RtRJw7QxmRTr1fAg65Dqe7x
         S++/tDVJ/X85/bKk66Nzs2qkybloGnCu3ZhdrKWtQ7BCndQKz5yabScC6myQoJYpbaYg
         ly1Q==
X-Forwarded-Encrypted: i=1; AL+hErEP+X0tcnzuaV59IioKLUWQoajYj25H+U5KjGYoCazn3kkUIms2yiei2nhS2gzMrWyFjNgxUqKa4B+cc0cwj0QE@lists.infradead.org
X-Gm-Message-State: APuU4Z9xjNwkV2I4QUpsMEk/uhQOOdZ/lNrAW4E4b4NjvsIYoUqX9Q++
	FGF6O0EWGiBWF+UVT18D7YJbLZ0tBYMxrKDPEmFCVfDA5gOluIQuAT9G
X-Gm-Gg: AZFdTZfCNqUk3J5MgY/pJW4U+TG/HxJYIu2Puip3cKk4Q7NN5n/kXmfRGThDDZIj0TA
	JvzM5KZA+0kNv5wLIPouUTFXg+cMDw4WDbzJoERxuswkV3rjejSYE7jb9otNYUljkU/AOGyzlwZ
	K3frOmsH8jPbMz44exI5I7z0fy16wjb/n+yicfHFYKmzzGaGl0A0JLPPZE+Cyo8DK/fRYj4zbQJ
	hzNtz88s9HARihNa8Kxk4BJT8U88BAskMi4S5A3OwxUHFbKHfGKIlN1hBTYvExp4WpcZd4NIVwh
	8jrveLhKjNZULHrhoxwayuM8Du3KYSrkUvDu1UaVUeD6VHz9aTDn/6q8tkORxSm0UrCNH149A2v
	xmkseMTL0w4AWkv3efmwZT8hw+xrC1Vk/KwGNWm/vFRGaIMc+bvMJn1YJO3NTN7cQdV4nmMuSgh
	MX6qih7zgXEIFFEtaXbnF59oguYssdo+Hq6pfn28gS8N4qVrKl0Eg31PeBjI3tPB/ALwL5vBHIA
	sZQDGzQBjQi+ZWmrPshitGxF21NlFG5xi+E8hbcQv03txUxoyUwk0m3seWGbxLFmCfSn6I/YzsW
	y0n/9RG8tmA+fH9N9j0PVrIk7Pgma5NOV4ZoyQsJLburAE4PSj8tGm4wObGXXdAObPj+LcrvG+X
	uEAcPuW+l5YTGs8IAfgT0hPK2FuGrQRzNyZJhepPJf0C3Ovs6ObVP7b2swbzEZ2sGJmIgRCN0uo
	HVxmj6KbXOdUucJXAIWo1eAHQ=
X-Received: by 2002:a05:7301:19a9:b0:376:c208:ed7a with SMTP id 5a478bee46e88-3810e41885bmr5387822eec.8.1794980902102;
        Tue, 17 Nov 2026 21:48:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:21 -0800 (PST)
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
Subject: [PATCH 03/17] ARM: dts: BCM5301X: N18U: specify switch
Date: Tue, 17 Nov 2026 21:47:44 -0800
Message-ID: <20261118054758.132233-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214822_956493_44FE3D00 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 5874e6b606de..4ae4e2d00b7c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -91,3 +91,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
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


