Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4393A606D837
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=27RhFiR/;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q+P23cMQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=; b=27RhFiR/QSnBkg
	/L6US8zSwA73IjVkWqVdUF9xEgJ3Z8T2wBqCmMNeWqs1PCYl1LrCoMgYomDMJhLWhLChkud5vAPod
	dyXppNEnD4sWM7D2s+qUtwPQXH78dsjvcoLKL5faQ00lYEl1H559GLcuInnCG8nhxzkcmogq6eTCu
	DSX2C9ydpRUmIfeNDq7mZYEHUgn+8rTLKEYH1wMK6lAFj+uX+7jRoWZ8n9UWhGh7NL2s37SZS2R9H
	IVo/hNfLwIYGbI99Zhri8OuIvVeF5FexzkqpDNLRglvMhAYnbhtnUCBpAlHt4gMFYZ0vMdu23ESLw
	mOa9V+T6X0USrQDzLeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7E-00000000uzF-4C5v;
	Mon, 09 Nov 2026 14:12:57 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7B-00000000uuy-1gKy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:55 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1b3ada81853so619940c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233572; x=1794838372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=;
        b=Q+P23cMQuB7VOMoULaG+hOOl1NDgtIM7f0GFc9OJnl2B9RyUnA8KDUtnvufc3iGaVO
         ALaw4AbO3h/p9fY4akGWdzuYPfRxk6+fCDzISwcB+OwM3Rl5e79uaVdiOsWZlPl+f+YW
         YYqBzQj7qDFuaY3q+XuligMqpf+x1oXmQiOOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233572; x=1794838372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=;
        b=WRxo+R9qMfX8zwPopN5y60sFFpAijVUrv9Vx0aoc/vZ2nVh73LQl3WMaQdVVOHriDE
         vuOQq/Z075KdJKdia8vQyJSplyzpfjAqlVZ5fqqo1ugkE7r9mFADnBrdMWxJ4U6l33qx
         J4bD5lVBcC+fg9akEhrTM9MIhtuSytA7WXI3ghncZCXjIl4Q0JAyknySL0ooHkFnhYDv
         FieeOtf2za1AjbE3OV5aUb6CRLdIUCpI2iA/J2HJmKNZHTPffDD8xekiyj0GRc+x1rSF
         Alj3icMRMrEwb7AQ9ny+J+KdUGD1ycFNnKBxeFq7BTTln+mTXLMDmq3v6d9ev09rOMtD
         smfw==
X-Forwarded-Encrypted: i=1; AL+hErFFy7v8jVDDRaAqo3uJYElxcfn8Xob4pAjIUO17HYyF09eeuyiCVta6DTRxAHJoTHSY2F8vjwf/X4ve5Zv7GQ1t@lists.infradead.org
X-Gm-Message-State: APuU4Z9+R1H3jD1cy84FN5y173dS35eP4cICyGdSfgINd4HBdPKOQ3vr
	ee8H9iHBYe5L3cFAtbqzGIEg4r4b7Pab+Sdx2YkFR+woZQaJ9ZQnjpZuwbcImCXZSg==
X-Gm-Gg: AYBFou0uMm5QUgSpijNkD5ufL8frDUir4ai0zLXvR+/eVayDc6LWpARkDlvZ4UoxaO1
	s8i6HFYCJpJpAstIn9HN3btWSVY7kly2Hdap9AshCSIt3MiUhL5fpQn2g/twWRlh6a+DG0tWgLm
	COg/Qnd2Qrp11gIvg/VLX08t33g1Rl6oDS781kUwO8Ig8xfBLaCfMITdKvPc36KoTQIj0Uv0U7l
	uWj17nD+YyQ/r8gq89zpybckaqnb5oKII94ulZBJhMp9SHT2O8GirHt/0C/PYbnDaLHl0Ft+j8Q
	b/7sZBFzHxbxHrEVYbTpbUSB+BOS+rP69s8ip9SOn3e4E3akYz2GUaIyVpmBwgvxhFx4duN2573
	+kwL3nTInv6KGnvghTCsA2tWEi4tcRjqkoW/oldDCSBCcHwE8LfZnmJ5vgA7PgJ33gAo1pPtG1z
	pjtjSWT0WlBVB9NphPfkVnn8Gm8FqYdCPOCA2KxgdBxedTNQApTZvESrAgPVsxEX0J5DFmqKFb9
	oUqrAxy+swjDS4kV09C5MUpclw43i8q6hDQEdbvUewCI2xS3WvTRAKHiSkcbhsKLrTaiqWU0ywR
	8iKCQae0E+t/vOQJccron7nI1sNM54CMETntv2LBv6vZkV+AL3blfxEk4t4b
X-Received: by 2002:a05:701b:2905:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b39fe88736mr6517005c88.11.1794233572139;
        Mon, 09 Nov 2026 06:12:52 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b37560d95dsm12254569c88.11.2026.11.09.06.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:51 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
Date: Mon,  9 Nov 2026 22:12:30 +0800
Message-ID: <20261109141233.983830-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061253_748784_D400688B 
X-CRM114-Status: GOOD (  13.85  )
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

The default names VBUCKA and VBUCKB don't mean anything in the context
of the device, and don't match the rail names from the schematics.

Use the proper names from the schematics.

Manually tested on a Hana (Telesu) device.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index be6e6fd7cd36..c6751adb1c2a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -314,7 +314,7 @@ regulator@68 {
 
 		regulators {
 			da9212_vcpu_reg: BUCKA {
-				regulator-name = "VBUCKA";
+				regulator-name = "vdvfs1";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
 				regulator-min-microamp = <2000000>;
@@ -326,7 +326,7 @@ da9212_vcpu_reg: BUCKA {
 			};
 
 			da9212_vgpu_reg: BUCKB {
-				regulator-name = "VBUCKB";
+				regulator-name = "vgpu";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
 				regulator-min-microamp = <2000000>;
-- 
2.56.0.455.g6c5a503b38-goog


