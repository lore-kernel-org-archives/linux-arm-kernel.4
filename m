Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA484606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ZNICXL4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGF4LEDM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=; b=2ZNICXL4LAMZmsQNpqbTFHW2kb
	DuLY6Bn+UJjxmsSK0+p30kpJyWB/dvaqV6iIvrqI+azbsioveWgG4CDuGX3u6Dk7rz0W4tR8kld+/
	Vb8d2JEabXegtW0a1IfCOtwNS/QCmiUjOa/N/hW8qTJ9Stw1tyJloLxUt6os+JHJMa6hP2BjwdfV8
	81tm2bx/Fz9B2qKyTGcue/VH8V+cdCqDubOZjPMFO7onQeXJ7TsBg4uSr5U3m7R74dZD9Lcbf26ey
	eUgTMSd69ynVFi+r16xU7yjGIPEBgCKG8JfD2obM0FyteV3nIN7tSBdOY1IY9ALPKsg+XiRs46H5h
	Wa3f4DqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbne-000000006Xx-2F9q;
	Sun, 15 Nov 2026 15:05:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbnc-000000006Xb-23sF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:05:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so2883705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755142; x=1795359942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=FGF4LEDMVsdjWWPw7tOjbazeb0FHxHFrSLBbjFZl7CMoCPgQKczgo7CltJmmVLBErm
         Ad04L3xYvX9VeMvuIOYIebbudTfxbmKs6AacsxAQLFtD+9uNPTxN1xnnZEHuiVsmtg4P
         EHhG/LRo5zKOdxdbD1+TPuLFJVyyaYAHX4xo4zZZHvHyvFyHRtdDzdygmmqSYAgRiClN
         F1uiFbj6caVzluSxp+BxpwuX4mXz1hf53Gm79AmtPfZnt2V3eWGFjkP2B3aJ+hydDwV5
         NsHXrNCJm9WZRIScwE/qIbKrw6vRfaRZAe8xkP9dseKw4N7i0r0x6RQs9vmbT9axKlJ6
         GWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755142; x=1795359942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=wcAzB3t7XYUsZ8Its7Nh2oIQRHzapz0pb4Fowkw0TdYqghc7xPOcbR/QplDIVMuh8T
         jQ9eMAzJ+uOFfGkeTxNXS1QjgZXOgQ5rISGqTW18UUkhm8bC6gvq2bhzJEmPNeKpHVWn
         OV2w8bGMsEcJPG5CkeJy2EN9JLyzQxeCKBfVgpAlYWFkT0x89Yj+A+/rg8rFw/Goo2zm
         SDfY1pCRrjPKZLGMBjFke94NIrS3X4pR+w6BabR3dPzHnqNTghY7VOWfkorO4k0nLX8x
         0Ph8bVfdNtzqkBLh/7gARhAjupx647OEfDIXvcPDpq0N+TuEp8jbO5aauCsO7zXd0BDL
         +P/Q==
X-Forwarded-Encrypted: i=1; AL+hErHR45glrACVMuWqa9YnyB0fKBFzlfzpwm7TZVxCkoiY0shx1Tu5IH7M46o+yWw6W3xk9RRLH4rsS6Jx2Xwl4eTB@lists.infradead.org
X-Gm-Message-State: APuU4Z8eggyFBwDwe8NuA9fOTjPtG7wGqaqLy7fl7iJz/XzLI3U5n018
	2eMqHPJPOj5V5bMCwkAika+j+lp6qWgoWVMUIqrk2oxwerj2zp6299QR
X-Gm-Gg: AYBFou1xEQby9dwUrBg/o2LfUKLOvm0OHqRrVmJcQ/6An5VObfJ+AKeK1X7ZHsEJWQQ
	Y0DbfpKOSAr+5XyX7rLdBkD7diBY2f27amXg0qK3J7JB+2CsHclgO7h/PpMRERvwjdbGXSkZHnW
	p9E4QgoWijHdUilVL2moL8/9v1jL1l0YVbY0z3U0TF/atOxssNTus+7Ug1jW8j4xq7ic68Oe6Be
	DmNcEmg1pzb1tU+GcHBO6xTdKzafevyourbTrtJwXPGQ+4BQT4QKq+BThPJfoiewBA1yngqHXYT
	tZpxZZdFLJajxT5sh7s2cbsjI8fHw8hK9Ii5of4oI95kJMTpl2oBwGC5OC8bgLrEhsXBRM6gAok
	TmiAnOZDm3ZnlMMI+GW5Vb9Nb0ptId0Juo0+3LL8pnVZewBglAEmoDQQIz+kRWt5LKFaiXWCTlG
	CUsezjaraI94wVkQqv6xlpfm4ZgcFt5/3U4s/BQB4wkVJPBzLZO/quwKwJfVbLKxdXezi9r6MOG
	2pnHRCvyQ5a7zgIAGDfsfAFAjNxhPEYgzB4L4RVxqp24hUUGHHBd4tNfL/PeFebi70bWvuZrTJO
	Y7P2TudPT5IJXFh8eUPsRF6P0xyex6S+XyslJlOE6zcSTiSSc96mdaZI6qKL4mwWIBSOMaUUJpc
	WaUblMK31ryDDNSbupo+SfHH/jFx04Lq0oQlNYysejoQ17eYtl+HqEezVXaiyD5dAw6OLQnojYy
	rjjpi+D0tbTwskmr9TGtVo5zAN22v/hqfAu/uLF760vhQ8zFfAep4rZoyvkpbpQCOlhsPUMYrWT
	RUYuxS6Oi++jtQ=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr169387015e9.21.1794755142424;
        Sun, 15 Nov 2026 07:05:42 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm313567485e9.8.2026.11.15.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:05:41 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: yuzukihd-chameleon: Enable the GPU
Date: Sun, 15 Nov 2026 16:05:36 +0100
Message-ID: <20261115150536.16212-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_070544_565097_F8A2FE85 
X-CRM114-Status: GOOD (  10.24  )
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

The Mali GPU is supplied by DCDC1, like on other AXP313A based H618
boards. Enable it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index eae56908b9b4..9e275f0217ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -68,6 +68,11 @@ &ehci3 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


