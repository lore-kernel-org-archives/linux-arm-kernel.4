Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429A60A2600
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JhniFjTR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzpUxRHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=; b=JhniFjTRj5u5zwlWCIFtvBh3wH
	DNb0GloW/K9fYFEQg7SSRBPxWFVZ4vmtE3p79iQbnQEEVWNG0lapOqm9ZfjTmRpYS+qe4TIuQK8si
	juxHBv9+/ltJSM2sxkw4MSGeoB7FdUmAFyfHdPEvOUfZ2KcsEcZvkaZ9biO6vMZ+h1ymXkiOh7h3P
	Ilv1hDpO0Qow/s2Du8lw9fqgWfPR8rvCkoH/kLBHtn4WBxyz71FphnhPtARNX6CtuACLfb92EfuGh
	Tw01uuRP38S4W7XJna/MuE3jAW1Wol9aVmC8o8xSYWyu2DIlzTbqpfct8lecEHTzIrexY6FankTh4
	yaNFxejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbbM-000000029gs-3bWK;
	Tue, 10 Nov 2026 02:28:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbbI-000000029dl-1ZFX;
	Tue, 10 Nov 2026 02:28:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA80262E20;
	Tue, 10 Nov 2026 02:28:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794277723;
	b=ReVnb72kxxCSNSa3Ul/3tsOuMG23fRegc3cxqeaqimM0IQx82r/Yh69x193PUuOdqq+e
	 85tIWs4WFzG08W/hpp8KyTTEAr55aMLbYXdkjVCqsA6IAc0mf2TYpxl4oQRMg69Rx8tfE
	 sCQjAOAJrmMfSuIXU0i0FIovYvi4D5wWL+oeMR6qIFMSzCDuUGxHeTvy5m1bIh1aPG3Q3
	 G3VJjKhe/ikjwt0P+tz6z8sTLdPAGxDctt7Zi/iRMl/E3OTdLfyBIuaOkDpu3N1WC7H3c
	 DuLR35aDcq5yHQh06YOCEL0TH1fERE1xAz/bP+W5eOOEr1OciCYLXXqsaNGZYRMNmrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794277723;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=;
	b=XQso4dbKuzA8cTNVV0SNVO6MHXH1twWSnNesPV7TPS4pM1S+RuGpAadkx4v0a4pNq3gp
	 4lojg4nSsu4icn0nqfryF7yFXE1J9GRpceDtWeDViRzb134DDqWTqREApDZav5GP6yAC7
	 JpiFEdA5Mh+41PiLN9ODBxSr98+8zGO3k4IgWmI3foUS7Qxqx3+jdGo9hOs7HU50WLJeM
	 YzyN39klelOwu8D1zwozccB7hRVPIoNZDutniGIZ/y+Lvwj2QiaXCxkcRQ2dfP+WMFXF2
	 fznd7TSsviQ2XPv1TsDZhmPxsx0kt4CSKDz//5UGZ/h46Ixm59NhKe/r2AkcLabhJhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43ACE1F008A2;
	Tue, 10 Nov 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277723;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mzpUxRHwHFoBB6//8UkfenXLP0+N4IEhnxymC1Yb9S5vZpO2pji7kolZe4uij6C00
	 EpSYmhCeVxD/ViLeYtZT4oWvAGdenSUpukQYbBjPud/umca1x+swOQJn5r5RqvvBMn
	 8d8UD14mFYciD8gtTJkVYcGZG7WbshPIHUalSSYMbBvxHo6lzkv1Az9QRBosXa0dJc
	 0rbZLmpLt53xcZdfLrBzBxjly0DmLVGrkwQJZ3KzlRmCNUE09MW73zV+XJLM8IMge8
	 G1cGVTopVevfA2T0jC1GY86I7a1ykRfb+n5TKNrU7YrkQyyGR4r4HHu7GTQ/MAjBwr
	 OW+6CrjmBuIIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0BD948770;
	Tue, 10 Nov 2026 02:28:41 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 10:28:25 +0800
Subject: [PATCH v8 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-audio_drvier-v8-2-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794277720; l=851;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=DMgqU4dy+C9otoBnz7xzg+U2RUB122T3zVnjUiL76gQ=;
 b=6BQpXVkZnsnNKIesQNk5sWSYdBPvE4chX1wqGNXC/6aZi1VS4vlh+/fkXxe8bpTFUBhCNLdjo
 GWyvxOJOZxrBIdhDKK21mqV4ENPhzDR8XlYZzv81+/Mz7VQ8r6x9o7m
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiebing Chen <jiebing.chen@amlogic.com>

Add S4 SoC tocodec compatibility support.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750..7e053aaa0f59 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -25,6 +25,7 @@ properties:
           - const: amlogic,g12a-toacodec
       - items:
           - enum:
+              - amlogic,s4-toacodec
               - amlogic,sm1-toacodec
           - const: amlogic,g12a-toacodec
 

-- 
2.52.0



