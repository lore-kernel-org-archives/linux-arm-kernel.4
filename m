Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C452E606A885
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Hhrfdkh;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZX+qUxBt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=; b=2HhrfdkhpeVxfcKpGxEevup611
	S34MwoRv46wX/uBL/cP2o49KkH/PlcJqZuMlpwOt8ifYRP9qpYIC3eGiJ+DXpGfEGY2veh3txQrXM
	H628oeo3XyrcDgOZsrWqSs2J2JjtDuVe2710TXwDKDnNx3a8GPgIaoXIeSI0CZDmE9qTCzVz2wYho
	bIqrIx9k8dobvdgAcaQJIAqqanyZyz5+Za4ZV9+HKmUYG24HQOen7WPStxlxCgMX9mcz5T+NYkat+
	wB0m5eAKvIdgWAJWMzSHbGqSRKktCs6nOr77VPulSqWqaWXUSrYjgP6ZNjvCX65o1aL2cGxVUZx6Q
	mdOpjh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf4-00000006pxL-2ulh;
	Tue, 17 Nov 2026 19:16:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf2-00000006pw0-2TTs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:16:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so2386045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942967; x=1795547767; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=ZX+qUxBt3WiET5Tmp2lPC1qB1xZGfNiE18tiYGW4bCQgP+yYEhVUumo1j4o4fxWTqK
         hhRm8G73dDs5iCd4y7JtjL1K1/ga14LRHid8wq6e7rTs2FM+drX/euzm9RIo8h/MTu7E
         EFaYWqUlZDNPuov1M7RFJx3OZ1WV5xgeNtDaHofKccft41EOO61u3MWulp/ZObH3KDlz
         0vGiL6ddW3wQROpT4By2eXFakasp+VPvFVwvUefldkF/OPtgYkfEyjUXivmgyTv1ShtX
         7y6G55hYQywA0NDu2jcBz7Fdq5VbJ0Dw0JkKisKsOJG2vRE+kIgFlVknfhWr5x5bNYTR
         q/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942967; x=1795547767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=i9vAfiFw3j4DKmmiKTVDcp9AnguYENfxLgPnR6y/DwbRHHkjaPGJU9yJEuljU0OMrR
         JH2THzF5KCFij6DvWlsnKUsf6JxlyhmMYtPQpqp0uFZLekNDdD/Qg5SEhg4US0Kt9QP8
         j/kUtHjpwZT46PNjxiIbxxrHo/y2LxDBrIfCOvg887xQKXE/oO5Hrr7zFo0gbihJqF7E
         OsKB6tugqeIef60EadrERCdcqoBi763edlyfkxPEe+MZICzE8Gm9zJAbnxix6/uYBk3j
         kMiNRcifUuME773e/9OB5rKLx7wyMoGxK7Ogxjwlrn1rtnAYkHsPXxDlFLooqqP0IT9z
         UAkA==
X-Forwarded-Encrypted: i=1; AL+hErHC2zetJX6nNR/P0eGURwDJ9nEZmLF0oHXCTmJtT27veZF1dJ4pTREMFO9uTdOjLGcUlSWWqFO+oZgYGzx8VRba@lists.infradead.org
X-Gm-Message-State: APuU4Z/r4iK/uUfkalJnlif78xgkrgRMa7yLGH6UjsQDgCGK8d8Gwkp+
	u9dz46VsI4TDEB5CXqyZtMB15cjAUgfuPgE6f2YnOn8jXIIs+2O+qsy2sGlZZD8qXZY=
X-Gm-Gg: AYBFou0GrFq7dVuAkTDDmWhW3Ash+fPSqyCz+aMCsvSTyEfT3U5KymHiwX6TuuVe0p4
	YI4sIM5ivi0GuGs04qyJGjK1LYNWvyAmpH665711JEK+X4x1RoAfZsgCtDdQHFrmgJVk1e7d2Wm
	hVZ/kX3jXHdzFMxKbjQuwdspF1ML4KHeWVdL37Prvb8pkznPKE/YzJx9gnnfjrr5Ru8fYeaswwv
	kamor3jrpCaZUdXNANfJ8QurHVPEsyZQn0yl0k2AR1FPWxsO+JVrVqWdLyocBYdO/YXr0oFTm8u
	qyG9p1RBM4BL2vL5tFf50QfJzmAc0otlaR2thu65MZS5UHOFx91icgtx7/LKLXPsRgJuy63gOkh
	s6uiyf+irvwZ+XG5mSnFfrhsV+1TTanRmT0ARrjWwLSrXVEsaUhkyTz6eNFNZxm5+ucZJT2VVpR
	+ZiNcRxCebWzKr6wDnfvs4FlU5jFsC9T6IC6q6g0Od4k1RoXeZohWBMlkkkmH+QaQjwiYz6fXnJ
	XIjqsvqGhGdH9rreF6K16DPdfSjr0luXJ1/VWXUWiuKO7Je5wgpFYX2v69teYvueR7ShcJHxmZo
	WVcKHkupM4myMpfX+cwncJURVZLUMJsnCMD/MJP7vybJhu3ao2i0Sgbx
X-Received: by 2002:a05:600c:8b8a:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb7da2240amr3295515e9.6.1794942966666;
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/3] clk: mediatek: Model MT8196 PWM source selectors
Date: Tue, 17 Nov 2026 19:16:01 +0000
Message-Id: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGn/GoC/y2Nyw7CIBQFf6VhLQkgD/FXTBc8LopKW4GqSdN/F
 63LSebMWVCBHKGgY7egDM9Y4jg0oLsOuYsZzoCjb4wYYZJSqnCqB6olnl4Ju/sNk0AFN4aAYgS
 10ZQhxPcveOo3LrO9gqvfyt/I8JjbU900ZE0B7MaUYj12QUoutdeaCLvXnjkmiaHCKy+95YIE7
 q1UjqJ+XT8P9MwYvgAAAA==
X-Change-ID: 20261117-mt8196-pwm-clk-0f154aa0e720
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111608_674572_EEB7E52B 
X-CRM114-Status: GOOD (  10.26  )
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

On MT8196, a PWM channel can run at the wrong period: on the test
board, a 10 ms request on PWM1 gives a period of about 8 s. The
clock driver does not model the selector that picks the input of
each PWM channel clock, so the PWM driver can compute its counters
for the wrong rate.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      clk: mediatek: clk-mtk: Add composite mux tables
      clk: mediatek: Add MT8196 PWM source muxes

Chris Chen (1):
      dt-bindings: clock: mediatek: Add MT8196 PWM muxes

 drivers/clk/mediatek/clk-mt8196-peri_ao.c         | 38 ++++++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.c                    |  1 +
 drivers/clk/mediatek/clk-mtk.h                    | 16 ++++++++++
 include/dt-bindings/clock/mediatek,mt8196-clock.h |  5 +++
 4 files changed, 55 insertions(+), 5 deletions(-)
---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261117-mt8196-pwm-clk-0f154aa0e720

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>


