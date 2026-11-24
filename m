Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AAB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e1VHdQVZ;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=amdxvHwO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=; b=e1VHdQVZ0zM5kL7TibXw2xLSY2
	QgUBYd8fqg2w9uEyVYuvvZt6O0ZG1Zwpqimm4w6jsPyqhlxVaVLtgpEexcyW1ldNcuepVjv1FSl2v
	3WQoCfUOE8tXdQMXSPXJ09eNV82D3uJxbYnnI+Zvu1ZpLTaBQkH2FvnBxTZ1+K17lVYxiAnkEijeV
	8hvy0FRHMQ7VZIYbUbmzHsZ3hHgYUcFOz9CvKgQtesZTdhWZSbRlhAPQDm/bZOBKZRwHp8FOHSiEX
	wS/q3rU4YI6A83RLMtNTVVXtn59NsDZkM6y4tqp+yuHZiPKu8lc0OKkBmYvKzPy9sS4XXdgklWdyd
	sp3mQTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrVg-00000006kMU-289B;
	Tue, 24 Nov 2026 14:28:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrVd-00000006kKg-14c6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:28:39 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f046b0adc0so24313515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 06:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530516; cv=none;
        d=google.com; s=arc-20260327;
        b=cZnESxtAfqFC0poAbBP4d0WW+EohBhjbIm+GbxBNApTBnXrod8vy5/nrQPr6RYYn2/
         rdVvFv0euiowu2eB+/vPLmqHH6nVAYtpeaDbb0ZivfRntgopeIn23mWTYHKi0IoMLdjK
         AtVuB8e94z3t25WXf28NWTFtqms7MDJoupCsUogzjuAkJBGRanEYD98tKeNB972IxWqn
         KbG/DrYRab5DV4c0Mdqtlys8TiU8+sCsG8b/gmF8uw88kL8cQnZdoFyH9flY7qF1/5EG
         iSDShT+3PEFXA1oodapjuZ79LqUSVsb5Q0sQjfovINQUfFfNz5HCb+rkyvaUvxqNfgg8
         Xq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        fh=dseezxVj31t8qCzu3jEX7LIi8r6HvkvYxh+akAmji3g=;
        b=YBKY28fwyMhd2BIM30x+6tQ0JCTt2NIE9iJ/3DkZbg8JUhcT/+sS0YXbwDCTVn/MOo
         nEf7KPlhXjUFoETmMHyDoA06s2/QY2dhUdI2C+CQxEQPTmm3VWCu1BDq0nnPAfrWWO+Z
         VoYg+BO02zGDTFOesa4w8iQpAHulaNYsX55OR3Bf6q90HY8ObrYUI7pS+ojHLgchpCp+
         BT6nbc5sxxv1xm4bVDadZIDW1w0ZmaBC64vnfvD81woy1QA43PyYCj2kEwp6MpfR7EyD
         XxWya/tkOxwit+/w0OvJhz8pRdECSCGGactmKnx2Fkzf8iCA0qIJRlb4SCuZQCAFFIMP
         0QKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530516; x=1796135316; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=amdxvHwOdJ6Wtdd7BieupzjKPwH1MzlPF2LCB4nOHgD3g/FMlsO9LEb3ZgMfRYqfPO
         +E+PjHhgZ5BoOS/1/aRvDivy+KU0J/ilF2eplTa78ei1+fgVEHyytMW7bHDvCAwDjIhe
         X+HUzhy3vQEWXyFmmqU0xaOnWFjNHUNwEacc2lKSAvtq2uCpV3Y+TvpnFE4FuwPGN12R
         JZJHRdK8C5tVImA72G73QSQUyXUkRkcMgOH91XDajYcAKVjtH11CrJzxe2gPxzxV5ya5
         htHGXz9hDeycxsIEYS/xsvWeK9E6TgGQ9KbDj2ur/4Zi6Hbha1riHrQQm0ON8VqKY6fS
         WpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530516; x=1796135316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=09OMU6ESj1Jcy+lFp1YFLaKb6XB6CIWA4pBR1Dsoc1OW6CJU7pRpaQw3ryWgGY+vik
         R53B942HwGrS682AsqVTc3zWv+QdEGpU8PlEedudA+lyUkY6yhuUPNNReDHIXHPV86t/
         30f7Pj2Lqag28NGvuhzei1cR8L2H9Uspq4Rkba1IVeUIP4JbaDqKdIe6XymfRKOyOkV9
         Pb5+EsdHDd1LRdGgc8HoYKdkHpYiP07189vFe4DPf8RKW7PM6gRjR24WRUIcrq4619K6
         BLpNHt+3VeOTNpFScmd+5Dkvfzrhwh3MLYMSCUWvZtKYyGoO5w8Jm0S76K1qn28TALki
         Xhlg==
X-Forwarded-Encrypted: i=1; AL+hErGq7QrhtNOFB21CFF2jbIU834mIudnAEFv89DxNmxk8hbpPLSd5Yx0sC6xXwFKncjyC5SOQQsfOzA4gvczAOX5h@lists.infradead.org
X-Gm-Message-State: APuU4Z+6x5oMyZD+xGQT690V4SfYvnnjycdtE44hBl4cR1zfochq9QLf
	HWKivnepAi+Rt132EzduHw3tQBHI80npmz1OOpkSQ4T804yJhyvtJRyEZKaMbxSEKEPSDDY+FKj
	hRhVCuTCafqY+IbpqkcUZ6kgWwLMxaAaZOY+BQviucg==
X-Gm-Gg: AZFdTZfxWRzsfg5Ng4OC6h2BsZE/KU7xIq3iDduVx1W3E7Xd12YOn0R088L8lP8ogIe
	0jbHlDM+epPpX+TH+BXc74J8oU6GV4uldGoXzXDSJyjMVXGd/Ve7Ii45LyVz4tZ3fCyMsNaS5Jw
	PB0+HU9owqaOYXJxYJpQXIGto0kL/8/ou1UePG+P6ZsYLq+AArbjn9ZuPHucmeEXWJ20JNYrINL
	7ZJDe+oYcjjwrJRezgkT7AID1WkcBfNVcppm09n7WsRT0xi/q3P1ZZMfMvrJSpKdJW4unYehBi3
	Vz5pQRjnFHEIpY+f8xq7daiGfqSIMqx2gwyZCAbAzjgzOcPN+ZB94oS8seKtRRefFDl80s7MCnT
	OFHNhGkkGXY0uuhQ3h1Ty2v8094mjWPRB3g==
X-Received: by 2002:a17:903:19cb:b0:2e9:9a19:c5b with SMTP id
 d9443c01a7336-2f03f16d710mr139233565ad.47.1795530515765; Tue, 24 Nov 2026
 06:28:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:28:23 +0000
X-Gm-Features: Aa3M54rrDo3X7VrfTe9b69h24tjA9EEIAxDaPhgJEX5YWMApMtqcKA6bBO6NIJU
Message-ID: <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_062837_306342_0F736BA6 
X-CRM114-Status: GOOD (  14.65  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +void mtk_exdma_layer_config(struct device *dev, unsigned int idx,
> +                                struct mtk_plane_state *state,
> +                                struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
> +       struct mtk_plane_pending_state *pending = &state->pending;
> +       const struct drm_format_info *fmt_info = drm_format_info(pending->format);
> +       const u32 blend_mode = mtk_ovl_get_blend_mode(state, MTK_OVL_SUPPORT_BLEND_MODES);
> +       const bool csc_enable = (fmt_info) ? fmt_info->is_yuv : false;
> +       u32 val;
> +
> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {

Definitely don't do this please. If exdma is asked to do something it
can't (and I'm assuming that these last two checks are intended to be
on w/h rather than x/y?), then you need to reject that in
atomic_check. Getting here with pending->enable == true and then not
enabling it, is not OK.

Relatedly, most of mtk_plane_pending_state should be deleted as
duplicative of drm_plane_state and it would be great to see a patch
series very soon to clean that up. It's been that way for the last 10
years, with seemingly no discussion ever of why it exists (my guess is
that it's a holdover from pre-atomic code), but no reason to
perpetuate the badness.

Same comment applies for the blender.

Cheers,
Daniel

