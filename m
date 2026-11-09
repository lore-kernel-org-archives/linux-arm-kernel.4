Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yB3+x6dQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccXvksco
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5MvHRwVdEM3i75cP5cg6RJtxZNyqJnSI+ZEnct0w6ig=; b=yB3+x6dQGd0kLv8IUPtHsmQiFK
	t+7gOUhjeZZyCxVUhfllVqeaPC/3yAZuxrGPmWSLvkjPtmK402aqCSgK/792YZCFW5FMnNErlPPQ4
	5jcvrJAeZ3B57DbTU+C9WcGklkl6su9DoLvPDpQ5CDHhtAvD+/35KPWH30SQlOK2CBtdFkQxSFSb0
	BnN3f26CuvWCKKroBMC1eDnDKYIODxG/vVuB3/1v2+GyDOQR4OlYEUrO73sRj8me8jiYmfFiyr72S
	LVFl7MAipqO8IUCyY1NFyqoCp+aEk0+HMybdeGcPQZv89fz1eA38w6T9YxIcC9mXqYWWWzovZ8DGW
	En5ZNIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVe9-00000001c0s-1l10;
	Mon, 09 Nov 2026 20:07:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVe1-00000001bzY-0trk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:07:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50D9960DA1;
	Mon,  9 Nov 2026 20:07:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254828;
	b=Zomhx2pE5LmC3At3IRyWWhGoWmQcFnjBSNpdaHmpeA6IgPHRhbrspX8IXXkG9jdTU42v
	 0dqsCl/S9jfR+ZfnS2xuAsfdp/uOr5CCqJBC2pTSwf3c+IR/OHQhfy4C5lbJfLq4gx5gg
	 tdGlEAo2vqrO885QBG6hLakVic6bDlhmX34ME5brXerNyGSszcZSNe2ovbFrmYV2iCUFE
	 SuJqTZ+kNl+e0D/WoOkMwEf9iqHobkTYPaA+VSfSfKuNJGkudDiNkdrXlEDU2wyw0j9HK
	 DHD+PHW8c2iHylf8Z1euk2jvu52VNLbyB57+smyNffaiDL8IrmGKLCLdKYRrXHlPD6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254828;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5MvHRwVdEM3i75cP5cg6RJtxZNyqJnSI+ZEnct0w6ig=;
	b=tA6Flb/GKKRbx5SCi/0Ns0doam7KDicIJt+exsK7djcCZEGsym4w3hTQlth4dDykfmum
	 grNZYzRFe+CaUkcv9QkxvbbwjhUwAE3HVgNRLw2nmurFVQR+1bIbNb949xwv/mHED7O3o
	 BWP2pq9P7P59WVT4bpQUYU2r6YhMz26+XwFeANDghW9lFt2Il5eB15xaWLJZg5XiNL5iJ
	 mexgI7gv0PcE3EfHwMjGpOyQeTCC8pec0R6EiLrRuDeeYz1eVw/b41nT9To1KlyE3tkQO
	 UDoEELQM27hpKJXbnamxDXXbPYvkR+4wz1/HvL716Rjd85Hl+9DvEWhvQuCtLLf538g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E133D1F0089F;
	Mon,  9 Nov 2026 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254828;
	bh=5MvHRwVdEM3i75cP5cg6RJtxZNyqJnSI+ZEnct0w6ig=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ccXvkscoAq6LbmkDeKCeGh3cKmD4V5e2vx6z68D/YN8EVx8zxmWGrZsOfxsa4dFvL
	 MwNDdkW7NOAdrYUvKlQCExfIwGC0GG7MGY/Ug6hntvTTrTu3F7GeLj6OwjFyqr0cZE
	 G/ucUjjuOoQhrUwULnIXuyctODWL5u3ChwfJb+szrID2BiQEmkgKyxvsWiWbo2KPx/
	 DqTKHwpI9giZStVClRgul8wGUnQpZOF88IlXKqULYecnbkpo8v0VNKiV3xBPuFEq8+
	 AyOpS0L8j5QnmETyO0PKlLe/Yl/7rpHEPMG3Gxwj3g0pSY2ig6m5v62aEbSP6LOcsT
	 41Z9+PYGhvgjg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 690B74862C;
	Mon,  9 Nov 2026 20:07:06 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Subject: [PATCH 0/2] Add support for Samsung Galaxy Tab A 10.1 (2019, 4G)
Date: Mon, 09 Nov 2026 20:07:04 +0000
Message-Id: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVRpMJVxIJ2yojQdEok4u6K5
 Vv8fwGjJ2Rokgs8HsS0rREyTUBP/TqiIBMNeZYrKbNajKEvzmUJKHh3bvNBWFUaW1bKFFpB7Jx
 HS+f3bLvfvA8z6vCO4L4fRuJ1tXUAAAA=
X-Change-ID: 20261109-gta3xllte-support-f64df476d3c6
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254826; l=1334;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=D83yNlrKZm4oQTEpIIqvCrphr15D40LgficU1Gj48VY=;
 b=nS+UPIBQn07oWPwRn6cArX6coasum1GBeCuCmmjZLvVXS9+bgJNpDOBn11k8jXNCfRrls7VfJ
 H8TKLShEXtAAtS6SwB4uvfKo/9RLF2/c2d2F+lG83ULRlmeFuZwQmgL
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi guys,

This series adds support for Samsung Galaxy Tab A 10.1 (2019, 4G).

The device trees have been tested with dtbs_check W=1
and results in no warnings.

This initial bringup consists of:
 * pinctrl
 * internal eMMC
 * gpio-keys
 * simple-framebuffer

This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

The preferred way to boot kernel is by using a shim bootloader called
uniLoader [1], which works around some issues with the stock bootloader,
primarily the decon trigger control quirk, causing the framebuffer to not
refresh.

[1] https://github.com/ivoszbg/uniLoader

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
Umer Uddin (2):
      dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-T515 board
      arm64: exynos: Add initial support for Samsung Galaxy Tab A 10.1 (2019, 4G)

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 130 +++++++++++++++++++++
 3 files changed, 132 insertions(+)
---
base-commit: c916d326360966fa41b1d9c3fb659215053387f5
change-id: 20261109-gta3xllte-support-f64df476d3c6

Best regards,
--  
Umer Uddin <umer.uddin@mentallysanemainliners.org>



