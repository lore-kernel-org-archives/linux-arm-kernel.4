Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9617606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5RlJ/yh;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=B2KRURmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mbpbveztx44WinZd0OoXNduwiZpW+0sT5m096jfRZC0=; b=M5RlJ/yhD/z/hT
	hAqwgCozaajj/ZBEtlF3mIOB0qfOYbCzDNAr2I85arL0MWOXVW7YL2EGG+rgiJRwEgnA4Pfg/MXcV
	H3MJGGXvurzTCigrY9EPRKumzSc5nOCUCtviZjGe7BRwY/7x5t0t/reBKYeiylH8luRQ1benhdpK8
	6qNqje9oGxuF0VKUwvMVaVbTPJvo5cQ/Elv7ZDbSEVjl1cPVDCnNMeZfT0J92FtlZ/xLKyOmfJ/pY
	3ihW4yXV7qT1Kb88z/aaQ6DV2I8XXnzL/9RJ8S+/uqs6Ic5Bz4Uspxcw0fC7sYrpeB826OeqvjaLt
	RmDQEdM2uo0/nssqTTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrk7-00000006nG9-0kZL;
	Tue, 24 Nov 2026 14:43:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrk0-00000006nDH-1QcK;
	Tue, 24 Nov 2026 14:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795531406;
	bh=+xcAFVyfZjCXw78iH5eaRb7q+NmVOvWAJooUbJ43vpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B2KRURmVMnzlSfh/3guyYTv0j1AWRjCGZuabqe/B3OntHxn9B6dKAJlHu3SsD0SmX
	 LVx7ce9h7L/4YDDzakQDdcWAV5/SuxSmQdgV9W4q9R3Q/+FadUwYCgwbpDXfwx/tTL
	 YDOcAga1u2SeU8oIAoUCrt+yi1oenovqKr0WL994FrkADzRCCR7p1TGPJ3rSPs7lhg
	 DohKMBp6gc3i+Tye2dAgBd45g8euDbjJaI5s2Yrds/IbAWjjsiKDXGXkqveYe/14NK
	 idOJPckaCha8mz4XAFBjFkKfjPJgAsyYB5ypR+h02NteusfcQz7da1fm/ePzS4rn08
	 aAf3b6kdgfguw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C90117E09ED;
	Tue, 24 Nov 2026 15:43:25 +0100 (CET)
Message-ID: <05cb7522-7894-43b1-8bf5-96a1a3792289@collabora.com>
Date: Tue, 24 Nov 2026 15:43:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/46] drm/mediatek: Export OVL Blend function
To: Daniel Stone <daniel@fooishbar.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
 jason-jh.lin@mediatek.com, kernel@collabora.com,
 Paul-pl Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
 <CAPj87rOEtG9JqJsEZkatqrWUkerO9Xx93MBUrXXChJwCokE0Vw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPj87rOEtG9JqJsEZkatqrWUkerO9Xx93MBUrXXChJwCokE0Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_064328_848212_65921511 
X-CRM114-Status: GOOD (  16.81  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 15:30, Daniel Stone wrote:
> Hi Angelo,
> 
> On Tue, 14 Jul 2026 at 12:44, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> +unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
>> +{
>> +       unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
>> +
>> +       /*
>> +        * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
>> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB888
>> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
>> +        *
>> +        * Check blend_modes in the driver data to see if premultiplied mode is supported.
>> +        * If not, use coverage mode instead to set it to the supported color formats.
>> +        *
>> +        * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
>> +        * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
>> +        * will get an error return from drm_plane_create_blend_mode_property() and
>> +        * state->base.pixel_blend_mode should not be used.
>> +        */
> 
> This hasn't been true since 9813e158d13d. I know this series predates
> that, and this is just existing code, but it's another instance of
> 'lie to userspace and fix stuff up behind its back' which we should
> get rid of ASAP please.

Hey Daniel,

thanks for that - it's coming just at the right moment, I think. :-)

Cheers,
Angelo

