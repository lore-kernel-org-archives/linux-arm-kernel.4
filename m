Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U/ZY1bkl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvC3k2YU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MT69fl7958f35mgL+cf3gwuQcSNrSgQ2F5xRyYMscKI=; b=U/ZY1bklag1QtV
	143L6UlRWSXdhcJFP5Xf/QqvNbuG62fBQHmpPCLRZ3SwUVrIXt9UBPFOzG+CgXEc/ljVB95lpdECL
	OiD0tVgmYxcxNXizqj4lZZZfHP6SXfdOkFBQdqIKw3cXhmBl1B0Ox9Dm3hzY6TQ4hM0b/3BfohUca
	ajwZH9PNlv1VJCB3T/D3Vx4tlsjvmubyA/9EKOrACkT9dY0g1+rRhxtGfy4km7pfkhtkViXdiSyrD
	zdGNYdpSCb8Tn/A0XWSarnV3sRmWqvFK30xmzSyyQXB4OmgZiuoag2WxJPYZrNatW5kFKVP3x3RQb
	vYt5hIA8KJy3QuwWP/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qO-0000000G8VA-42OP;
	Sun, 08 Nov 2026 12:17:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qO-0000000G8Tp-0FLS;
	Sun, 08 Nov 2026 12:17:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCA364384C;
	Sun,  8 Nov 2026 12:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2941F008A2;
	Sun,  8 Nov 2026 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140275;
	bh=MT69fl7958f35mgL+cf3gwuQcSNrSgQ2F5xRyYMscKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hvC3k2YUECUU4R16MmHmvuFEu6nG275q0OfsyLIRsJMZjlz8oY1Nw9JXCHzb5sDTi
	 K9JKK2V/2l+hSyd6iDrr371znsb/71ywpEkAZg3BGLVZG+TRPDz0WMYhZYZf0na8EG
	 KQqWQ6P/l2z+57wcJuuJ0qP4V+1vBUKYRfl49M6cUTwkYfuxwB0banjXgLTILN8uGn
	 77dD+TMznQKEfV/Sjcif68kpvl75UNBvAmh6kTQ8T2Dm+DrXhK+K5twePUCjT4aaPN
	 NDRYw8tuuyKXDUF7y9KImE0PCY9ivYSfJt+8UW53L0HX5PgUtfH9cZTeyIWYyT81Ve
	 aKcivKxhQMPeQ==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:55 +0100
Subject: [PATCH 08/11] spi: orion: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-8-3587b0183cbe@kernel.org>
References: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
In-Reply-To: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1098;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=yh6M+dZbdbrK1vkY6Im9lR8DhinANaCbpgoKrriXeYg=;
 b=hGOXI0JIhFdu6cYxFmVFQgIvvBHkhsXS9qY0uy75k4xiaGp6FzXQCSG/r/NhglQfhuAD7uoQ6
 stJFrhfo/yUBkRyg7FGD7TMshe3FCxDfyB4WhnScvXmHMuMmOASMB5d
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/spi/spi-orion.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index b8882229c054..190842f710c3 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -789,7 +789,6 @@ static int orion_spi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return status;
 }
@@ -806,7 +805,6 @@ static void orion_spi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 MODULE_ALIAS("platform:" DRIVER_NAME);

-- 
2.56.0


