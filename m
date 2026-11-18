Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DDE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cb8BR/9z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTRFYQ7x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=; b=Cb8BR/9zGzoBuH
	P1UcKyHPuF5siWV20Lnfyrv0GIA3oBrJrCwNtg3w5/EsPiNmgyGuCB4rRZhMMjpH8Hwwk0hr2+tX9
	GMuvhfpgMuWJNFEa2Wmi5h0+EbSq4GQERP4lXQRWv3uZTHtZ1s40oOE0BDuOt3tw3JPJtSZUf4BkQ
	b7aW7MkqfMwXQujycOU4CGN+erI0Tm5mOEJjxYcyQ4yTNvKerK9TIfquWRBQUXljs8MxpsLQxdxG9
	DOCZ/OgcUov+hSorpbPfXukcmBG5Ai4YPZmaWHZ1CGucsteO/V5DdzUphSrs0OUXr/R9k212WhwJ2
	ver4ivUbgdyenXYZEHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTly1-0000000ABak-3Ras;
	Wed, 18 Nov 2026 20:09:17 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlxs-0000000ABXq-0EpH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:09:09 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-4b5cae8da04so467413fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032547; x=1795637347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=;
        b=PTRFYQ7xRIdzLJ6hCi58jbrqNgdDX7FWgy5/jXpPdk8UmwpLu5FA37oYKsEkaLWyI4
         k98FYHl3eUescJH2sMdUjGZ/LScY6S6a5INnTGM8IIm9xG40+CgZHClxTERl5vVmJ9Sp
         w9JXGjW2ODqmDnb6H0mZaW9ykgEvycBr6kJpGFy8LL1E4g6zd6M3Jt1BIBKd37hYW3Ly
         iVOwy6ib1MQAU+AFdx2Al9G18pdRUoUHFWTXA9mmjGsHDeYsoJwK7DCH/brOi8g4iRuE
         0vfET3GKg5FBucm5785/36DKDsKy1m6hoeya5vgq9fv5mpmR3C4HN0FN9E1mr8d/r4G0
         Fdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032547; x=1795637347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=;
        b=QEnxTxNQRMfRfdoV3U8cul50YM6wAYZmlVVyFiLq9ComWtbu/aPInyYOJQJFg9iWBR
         cPaIoDfp2PffZcarCIp1UAerrIIjmlLWfV+/11rFZp8i69Tf5CfdR/X+2bQp61sTU12O
         Gy/ZycTliwJtbzrzBVRHHAVYAToqXuJ89aFEc+KGTtgL5s2Ef+odUw0U9GTeEqwUCv8r
         SJlSfpRBpyKkliaunCvw4SO3xb6gBMad41R26ZZgwh3uHhsEn7yzvnA5k4/8btuXEmHK
         RuytVRjTwv8vvzEABm+0YdDYWSmjyW6CVyRHJqOKX/JjEzIaBo1gOdMl+8XlW+P4VPmT
         KjgA==
X-Forwarded-Encrypted: i=1; AL+hErFpXWlHFr6yB/r9EBqBUBBx3IV1TjF6Pp8X/1ZRkQMfiZ3M9JXFPjPcUtpqehqCzDfG8UzjF1gj+ZdXDB25Wu3q@lists.infradead.org
X-Gm-Message-State: APuU4Z8icabjazocUSUX2J9gImxfYJt5vpeRgBa69QccsfS3G0Ypl3GJ
	j/FmlM3dAdPhAhDp5fyG1WfJ1PxHyM7MeOg7L+72fHGs02jafYzLiVlI
X-Gm-Gg: AYBFou1FXLpTTwAPmMKP9x8wJOo2UrZoRPLJ1im+VU1k/p3mC8ulc/CjYCa0MN8Exe8
	7JJRHmn60Rp/tZSUdejvC8brrCvmdZeHzyea6XVgq2zeV8UGTDHEzCTwkxc/ubX6DdlvPeyTpwj
	0Wb6VjJo40Td6oOHvI6o2+K2WDKvLil6F4VCRgXvO2DkFhVdJ+IVtJqqZI8AqmDBUoG1vpUQvff
	Bb/rx0/RIEExeFA/vE7nLnnniYAk8fNpkwydFNL+pLnSy3cTIjUcWN7Eej0cCwWO4B27HXP5xXB
	jVckUbnA30gHtpFNRli1jl9L1XDMdIPxj8V4eGXMj78t1NP/uETvQs/GCOgdOJcfEtnGAtI1vHS
	mQdzT6jVmJdMvDuAt+vI8VXQlDKcLL2RanaFGG0qdeEldtMCbAGXtuJ5GKHBEYjm16Nqv8GoS7t
	B8VXVRzYIORFAxm4/yf7R+iv4wPWUKFvVd448ZZ35SB1gh74FXnkchjSsfahajfsg9kNG4b2ivD
	jhhdCwz0p2FxouGtkGlhJuhS4YrtyLk3es1ghMSDfBlygGT1V0/RkG0ofTXLGOHIzeM5nzLsJyq
	HSSbNkSLf96e3Y7WOYetKd+Wb7P2Ds8c1hVtL3LLBRjnwzT9kNY9/rpeF/+ajYWuRvQkorbGSdW
	wkayrzQa+dXVm2/sM3LrmlsfQLggI6UGJHCNmbzCB
X-Received: by 2002:a05:6871:5311:b0:49d:e1d3:e6e5 with SMTP id 586e51a60fabf-4b75d550969mr3282678fac.43.1795032546658;
        Wed, 18 Nov 2026 12:09:06 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b7437258efsm3148235fac.5.2026.11.18.12.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:09:06 -0800 (PST)
Message-ID: <b662ae67-94a2-4e71-9578-d380ba19938d@gmail.com>
Date: Wed, 18 Nov 2026 14:09:03 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rva333@protonmail.com
Cc: airlied@gmail.com, angelogioacchino.delregno@collabora.com,
 bisson.gary@gmail.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, simona@ffwll.ch,
 stable@vger.kernel.org
References: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: do not enable HS clock in
 pre-enable for LPM panels
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_120908_100396_A8037712 
X-CRM114-Status: UNSURE (   7.31  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026, Roman Vivchar wrote:
 > Only enable the HS clock in mtk_dsi_bridge_atomic_pre_enable(), when
 > MIPI_DSI_MODE_LPM is not set, and restore mtk_dsi_clk_hs_mode(dsi, 1) in
 > mtk_output_dsi_enable(). This is a no-op for non-LPM bridges.

Tested on MT8173 (Amazon Fire HD 10 2017). The Novatek NT51021 panel on 
this device sets MIPI_DSI_MODE_LPM, on v7.4-rc3. Tested with repeating 
blank/unblank cycles, and verified the init commands complete and the 
link ends up in HS video mode as before.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # MT8173, NT51021

