Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B71606D813
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wd5dzb/E;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7nBQC8k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vIYgct9FxdEdL8Nwdi7Ov80zcE71hXhp5102ksEy65Y=; b=Wd5dzb/EmcheqHl2zk/PhhTMSn
	NsuUAi4dYZAknsIF/uXd5Ud8L5QropYk7AIAzmzj2oT2ngto6C9VP6vLvlhrtbrUGDy352negx+oS
	eejKDG6etIwVGJT2Eqfa40GkaRahDHOxN0YHI4GR+0R5owLLEV9+V85UTDx+6mkNN2SHquZqsLoWO
	LKo/uHU+WrHMlGngQToHyOJ3gZrs0hooRRJl21IpDRTT4wn24vNaHnH3BCgD0b3WwZw/PGRyochFw
	SN16tGnuv71y04I4iY4J45ayrV2+Nb9FQqOotYv2J4+uH6Kcv3AyUcSeJdAq8yj9UBfSFkmlyfBWF
	/fWinFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyu-0000000EY5m-3Tsx;
	Sat, 07 Nov 2026 10:49:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdys-0000000EY4z-2vjJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 253BE4012B;
	Sat,  7 Nov 2026 10:49:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048546;
	b=zT3PUvKOMnKur9dP6GlyhJNOc3I9UV39mCzo/q05/vQ5uChn/jfrTSmqnpS7Uterkpvw
	 X/3tV46CWzdkn8k9CTCHg7mkteMKCngf4lYAYtLD4pc8LRqT1Hzip9ppIjV6Wr2SzZ/Sx
	 DuZ7cSTFiUk7PD7Oc5V3030jTsuFosccpdoiSVSUyhVNmKOrqoI7cNaKo9obzIcXIiOjY
	 mK88Tl8v8i6q4hJDcGYxSeomx/Ds/3WS4yKD5ZFN/LDwA4LsnrY2nALn98+Fc54sGSjzE
	 mntkkrUmW6o+aY+z9hFnuMsXcfxE9Rl1sfFrzvTfJaMs4CkZhAMZe79UrYugOexjkwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048546;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vIYgct9FxdEdL8Nwdi7Ov80zcE71hXhp5102ksEy65Y=;
	b=Jx7b1LlaXHaz3sIOre+IXcxdcdZtJOl7euTx6CNM8MRqhZcsq/2PBDHKNcs915DFKXLu
	 maW4ulDuzE+TD7JhDI2I9+1+IDj1mOVfk4iXG8/JAJy/Egy42QVk+WjlLdjVTS6HHfdIE
	 TlE6MfOZGmwvQfyU9rFCEoFWnpZzf5HjfUcKWXlM3y7k+O2BJVCxgk5xXKUjKdFzn7eIY
	 bpc/8fbKs3es71dtBua7idkCu/0niLZODonwENne6m5isg3fBbjH3Sqk3cBfRAEMFX856
	 3eHQsGO7NaG+W7VbOeMeZvguIVnhMJy6piayJh3M2Jh2+imDMI/cW+2ue0oaznxk3hA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B3741F008A2;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048546;
	bh=vIYgct9FxdEdL8Nwdi7Ov80zcE71hXhp5102ksEy65Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Z7nBQC8kyTKj6pW+T/+5no8MU9flRduqht6Xe2Hg8h2v/Cwhgk2GjP7JKF9zibNd9
	 kTW6oPKjtsSbopQVY3UN33JBv+gKFn8mIYFT/g4qv3QeDlStOpoqMwQEdj7i3cr/2U
	 m/VUt/VSxt1eckFk56XnBu6JvasbWWHt+fLrAxJaqzT/3U7hPdxPRHyxX17pQ9ahsY
	 YDRefqVHqmrqU/hiHBV0v1FK/FNUSGng/gBW5SaO/55ybDlV0/wjt4x84Xuu4J7Oit
	 f3KMqx1ObVoe4WLhfEyQ0tBc9+WY75fxn39otEaYUO8Ayi7GFqZDzrvXKy/TdmPAuc
	 nbTwsJF551k3g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 86F9D47B76;
	Sat,  7 Nov 2026 10:49:04 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:48:49 +1100
Subject: [PATCH v2 02/15] drivers/perf: apple_m1: Remove unused variables
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-2-acf1e78da039@gmail.com>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
In-Reply-To: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=EV9fXCfpL3fKlyENxSrnQelkd6v71gDBFcBUcbGRPcg=;
 b=kA0DAAoWUkRBGKit/ukByyZiAGrvAhuiEb8Z1U79UtMuB3jppw2vSZr9YBVd6ehn9EEHlYM5m
 oh1BAAWCgAdFiEELzVmK5MGgNJ1pkW0UkRBGKit/ukFAmrvAhsACgkQUkRBGKit/ulGHQD/ZBKe
 pqjGQ6JyFX3Qkph4r3K87D0/UipcTgbP1BRt11kBAOos0/WKS4V4c/u8rgoYM9oFAk67XawY2h1
 r7RuF9jcC
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

These variables are calculated elsewhere as well, remove the extra dead
code.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
Fixes: a639027a1be1 ("drivers/perf: Add Apple icestorm/firestorm CPU PMU driver")
---
 drivers/perf/apple_m1_cpu_pmu.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 1f73c8a77462..de4026c63afd 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -421,13 +421,6 @@ static void m1_pmu_configure_counter(unsigned int index, unsigned long config_ba
 /* arm_pmu backend */
 static void m1_pmu_enable_event(struct perf_event *event)
 {
-	bool user, kernel;
-	u8 evt;
-
-	evt = event->hw.config_base & M1_PMU_CFG_EVENT;
-	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
-	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
-
 	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
 	m1_pmu_enable_counter(event->hw.idx);
 	m1_pmu_enable_counter_interrupt(event->hw.idx);

-- 
2.55.0



