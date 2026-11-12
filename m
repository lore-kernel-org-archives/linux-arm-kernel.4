Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE90606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n8/5AwXR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTgVSAfk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=; b=n8/5AwXRM28EhL
	4eKfeuzNL76iT8D4N3kU1BnJB+JY6fFCX/V+s6L/RVd1/FK7vFl9Tpc8pkJQlWvPjoi+hd2la+DQH
	cyRekG4hho4XbyvGrcodEdnNOTowHkU0ogeq9n8featlI57bVtZ57c2nGLv30/6q6cVEPM4n3O+JH
	FmzLKGXurCe4WfOTUPE1uQFGLmfbqZGq96h+N/08N1Cs4xPaT4uswX4N1tzepuKnH3gEmtlBUMV0R
	OeDS0XdlpPklB7da3zvuRvEP5K2teA3b3QaKQvi+m95kiLvTakP2OpiE2xx/LBWx7NUaP9cTHCTNl
	8aYnHG1BXbIxOOQS7Llw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVrv-0000000AHQ0-38c3;
	Thu, 12 Nov 2026 14:33:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVrq-0000000AHOS-0GTc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:33:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so47955415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494012; x=1795098812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
        b=qTgVSAfklzizixyf/Mbq/tNEYyd0YjfswPj7L4vhnuxLSUvQqt2pVjSPynvqIsUhEv
         ktgqf5fAyV3tpkIaiuXWnK9UM18wlmQ+1YHtQhQ08Cp+RBXc/MJtVSpB19Hum5A1rn9P
         RdugRCdqKFNnSXJTuf2YTnERam8CP4KVWxeJ0xEnz2zSqB56eZ/+ShNt4Z21HnG9270q
         FU8t0LYhEgB4AFJkr9z5Zh7irIAIMr5x863lubdjwpMC/vQ7xtrksxiFNsGcsYxMHf7j
         pRx8vvPpDOzXmhyhnlty6ZLGHUK8Hj965NUMJ8LruzNvdWCn4Ju/0YeJG+MN6AtTPupX
         iTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494012; x=1795098812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
        b=jQtrgF6l+xO/ovTEuK3ZyPSjqJ6OcUsdTg5jLPv52F8ULNPGcy4juB5x1RAFQ5N/wR
         +jZJk4OpLRFRGOYZCg4sPOYL323nzijh/fc3ZLTGaLUMUXDn+FU5ZgtmJ73sL1iI4OGR
         rNyipRnGJ5GoRGNgatJrhMxn6Rjscgv+w+03R+cmfUy83LEWEoAzFAnqaq7cXlbM7YJP
         ngsR4784hVzKVkxWAHdm+BV/MzOoXnNO/giccC+DDybxKaqCMnDPI7nk0MaxaCIxDKzP
         +f2nKgyqH59zzi3T+5+mmD2ZqaN4CwzXrTdsKv5mrlB250tM79eO9ZeIUVfUO1kDuMzi
         P1iQ==
X-Forwarded-Encrypted: i=1; AL+hErFyoVmqUVxqxgsS//SemE6Hjmj23yPivPLIeQZQuphPpxWG1CeS/yfnS09wlS3uhq1IZ0Y+xpYdnHTQrcIeL6rn@lists.infradead.org
X-Gm-Message-State: APuU4Z9vkUxAm60QDEYCdHz0RmiysCmESHwh4lup0O1/F6j6/xLcj+bP
	iaRjQ9guIrBd2Vn1oyNP65RfN594Qg8F8GqQxrVfry3aPbJXy+v4NQ/7
X-Gm-Gg: AYBFou0UeF0uuPTECaYCnk2Tg2SBec0DUbMs2W7dDyKGzzbuwIJdxhLoxUTpKAlyZT2
	RVGX2Q5XEPuYOxhvEfV4AWIc07bRcckZjzlHuAbRVxbwo5T3e2/SYwfPpU6ES0R04ESbbovqK6A
	xtRdrX9k95yCgLy5H6GpYPozSFNTAi6yl0bReU+6TZRKcp/siHg8zk2gqYukOnNaE1jYNifx17X
	C6amfRqbYziSycfm+sACO3R3mMTUwhM6s1QAw5yMGIEQlhPeEBFDnaOUbduJVNPVD+0s+2T35rx
	wHT8fe2Lxo4kgfP8zEbVQjpJGaBeqGscy14d9XwWB3OSVx79cX2C7fdu9Xv4IdUVCaEglSYfHGx
	u9YDqlTFFkKU2mAEYVQY7n3++yua0aokLEF5o7cB225vJ5+e/QIvyaWPVYq+a8Y1YNwzfWYRNWz
	Bp3TAEEm6BM3N9GT1bZxAvLzkVfZeRjN78WtVbDnVQuixrLMqp2naBvv/EFryM9iRAvEeBLj3mv
	oULmITDDz8+xmfD6DnUx3vFkRJMArJDxJIEoNrxWC48Q0vjiBpmTVeiaXv9XZ4h8fi/vbWi/1ML
	AZOVMVhJigVP6FC9vQ6B2NJCeSDNydsNXDQcSC3jEviJHU76kV9niEPbMqtvC4eQ+y3lwQvtgZp
	cR+RFg2M0V5xOeUvwJ0xcOySp
X-Received: by 2002:a05:6000:2008:b0:493:8847:841e with SMTP id ffacd0b85a97d-499c8982608mr10751462f8f.16.1794494011369;
        Thu, 12 Nov 2026 06:33:31 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:7c57:d4:a443:9a65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm15590804f8f.14.2026.11.12.06.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:33:31 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/35] drm/panel: drop the orientation workaround from get_modes()
Date: Thu, 12 Nov 2026 15:33:30 +0100
Message-ID: <20261112143330.2576419-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_063334_133632_EE56E23A 
X-CRM114-Status: GOOD (  13.90  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026, Dmitry Baryshkov wrote:
> The exceptions are sun6i_mipi_dsi, sti_dvo and the Tegra DSI, which get
> the panel only after the DRM device has been registered.
> None of the in-tree boards using them has a rotated panel.

Two are on their way for sun6i_mipi_dsi, both A33 handhelds with the
panel mounted for landscape use, rotation = <270>: the Miyoo PocketGo S30
(ILI9488, panel series at [1]) and the Miyoo A30 (ST7701, not posted yet).

I sent a fix for this gap on 1 November [2]: sun6i_dsi_bind() reads the
rotation from the panel node, a child of the DSI node, and sets the
orientation on the connector before the DRM device is registered. It
does not rely on the panel driver, so it keeps working once the
get_modes() workaround is gone, and it skips port/ports nodes, so it
does not mind whether the board also links the panel through the graph.
Tested on the S30; it still applies to drm-misc-next as of 12 November.

Could your repost of 15+ take it, or point at it for sun6i_mipi_dsi? It
reads the DT itself rather than panel->orientation from your 23/35,
because the panel is not there yet at bind time. I am happy to rebase it
on top of your series if you prefer.

[1] https://lore.kernel.org/all/20261109160706.2272332-1-romain.tisserand@gmail.com/
[2] https://lore.kernel.org/all/20261101203406.1360656-1-romain.tisserand@gmail.com/

Romain

