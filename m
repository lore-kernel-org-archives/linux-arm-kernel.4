Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96859606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YLcfNwGR;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d0oR7YLy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=; b=YLcfNwGRw+t9YJ
	LwaF5W+ntBeW6DNdU+O2l0bvK7F0wa8of2W5uGgV0dOX8iam295Jf1qFJyaSrCXB8RvpRlOynxDef
	zx8ve+Hxq1ScPdTcWBUatad3XUG0SFlOHV+/FoKGGsEvipwJHTMtP6dCT6pu9nBqBqHJ3mP9Ii1YC
	41IqpMuLhRpyR9VWJo4MVk+M86H453njpz4TDnHkb/aqN37yO5eLr1YsARwobw1WT9wWF13EelyM4
	NWLWzd+zEDOPg6cY0gqOVsMavNxCZo/raq7+nfpgPbgayFc1tgVpRTOalLBHx9c4ujC8nwzbdn5oj
	piah9aKNcb4MT0UFguhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7Y-00000000vDX-24jd;
	Mon, 09 Nov 2026 14:13:16 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7J-00000000v3x-41fh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:13:06 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso891737eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233581; x=1794838381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=;
        b=d0oR7YLyEEf9x8GbxwCV5Y/xSpilVE/DzyWxj9yKZFqfvOswYbTnDn+Pph0bZ7Hmcm
         T+fVO8Rrg7iPvfwhY01YpYqc7H50cBOhMOcVkLO/ZZte3N8F7netqITBAjCgcGmvXzNN
         S5GhKBuZRbJ3lDDUDZ1q9SskOwbKNMM42+Cjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233581; x=1794838381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=;
        b=yU9ER6uZVqLH+qpRHBD5eAVpG6LqSiAq4rPYyQzKL4fOtmMSUZGCGEFv4ODzXj/yrZ
         ZOygHdba91fa8qh3GrGAPq0ec7O8dfSsejvCKe/PwK4Tt615pS0ug1jQCwKdj/YzvV7k
         V2FseJ9gziLfL1+C6/TlOPourWX3MSmzB/65wypU4oX7brnAExoWfL/PuCZnL6VosgVy
         xlZGBFAdplTmayMKuiIEWU6DXBbmNMF5xHCSceUMzsWyAHCjodkOhBm6u1fhHE0ekGZe
         HRu7YqJjdNis9Itk5rikkf8URApk4AgoJIjTpFjj+tk+8Hw57aUbmV6Zfs6wPTkci3bI
         FtTQ==
X-Forwarded-Encrypted: i=1; AL+hErFgMN34Q0FTDLiZ9nwSwO2P6uRfwF+4cbcZTcNf4XseqXDqyw4im6AiKxhf15SOigYh+hsbsprEfjnuCr2WKoqz@lists.infradead.org
X-Gm-Message-State: APuU4Z+fH4T/8HkcUnvU+r5oiRgkrx1LRXqs3QJaP9KmOd3jzKgXmozg
	G/VriCzS5GGkkPxw02dJLbhLxiPbrolM1V5QeSsYL/EQjWkyWIsEaANRYYI7XqGYNw==
X-Gm-Gg: AYBFou2OFXQgW6IBjURSWkUKI2mRHQ6vGrLLHvFCS1maOARIanQaAleMbczYEcNvUn4
	er9yRtBN5VlGvHq0GzEzIE2yL4KKe+t75tbeq5l+NUKiN3F5mdJp1RmFYm+tSByXXRJYANYXMB3
	ugqUsEYh5JFknkXPSAN2qFpT0CeB2d+Tq7/DjCba+A/+Yz5L2UGOhA68p9xkzc1Cv8QpaKLK4nH
	Ft6sNlnExdjjxDNbEoHYEETmQat3WeH8LXq3k39GGQZdnJHs743p4kT4oVmNI2s3QoTQhAB2bSj
	S7+YXknE8icA17dGOQZrY8RrbTLnhjv1ji0jKdO1N+THszybEkxljBcMWH5Y8f9Tx+qCUohkOPL
	JzKinpow6c2UYMUSaM8PrZpA+FO09NoRakWc2fKU/S5AahTc6686w+yMh1bybXWAUY6993yg+gt
	Bqd9hm2/OskHUfRpD+KzsSL0vza0c4DCYjXmK1RQ3PUj05ENqf20dgKI8lPGIKCEPOU9bXQcPMF
	8GBaYQ/T8WJ7f7+29Elr2MomX/3oDrF0fUpPEh+BugwctAaCgKMGNnuXKuDupVBfEo8XtPJn60H
	+o0f+BZOzjDx/s7z3mTJMzNxRhC43XM7e0/PUwKkcmSgE6mEWl/s4Mjaisxn
X-Received: by 2002:a05:701b:2618:b0:189:ff2b:b194 with SMTP id a92af1059eb24-1b39fec8a89mr5374626c88.16.1794233580747;
        Mon, 09 Nov 2026 06:13:00 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b375603ee8sm12930496c88.9.2026.11.09.06.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:13:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage ranges
Date: Mon,  9 Nov 2026 22:12:32 +0800
Message-ID: <20261109141233.983830-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061304_966296_A9E3F767 
X-CRM114-Status: GOOD (  14.00  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DA9212 regulator voltage ranges in mt8173-elm.dtsi are much wider
than what their consumers allow. Tighten them according to the MT8173
datasheet's recommended operating conditions, the CPU OPP table in
mt8173.dtsi, and the ChromeOS downstream GPU OPP table. The DA9212
output voltage is programmable in 10mV steps, so the new limits are
rounded to those steps:

- BUCKA supplies DVDD_DVFS1 (the Cortex-A72 cluster), rated for 0.72V
  to 1.131V. cluster1_opp goes up to 1.125V, which the DA9212 can only
  provide as 1.13V. Limit it to 0.72V to 1.13V.
- BUCKB supplies DVDD_GPU, rated for 0.93V to 1.125V. The downstream
  OPP table goes up to 1.13V. Limit it to 0.93V to 1.13V to match, even
  though it slightly exceeds the suggested upper bound.

Comparing the voltage ranges against the datasheets and the CPU OPP
table, and drafting the change, were done by an agent. Manually tested
on a Hana (Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 579ce73de7ad..a1cb9230158f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -315,8 +315,8 @@ regulator@68 {
 		regulators {
 			da9212_vcpu_reg: BUCKA {
 				regulator-name = "vdvfs1";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1310000>;
+				regulator-min-microvolt = < 720000>;
+				regulator-max-microvolt = <1130000>;
 				regulator-min-microamp = <2000000>;
 				regulator-max-microamp = <4400000>;
 				regulator-ramp-delay = <10000>;
@@ -327,8 +327,8 @@ da9212_vcpu_reg: BUCKA {
 
 			da9212_vgpu_reg: BUCKB {
 				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1310000>;
+				regulator-min-microvolt = < 930000>;
+				regulator-max-microvolt = <1130000>;
 				regulator-min-microamp = <2000000>;
 				regulator-max-microamp = <3000000>;
 				regulator-ramp-delay = <10000>;
-- 
2.56.0.455.g6c5a503b38-goog


