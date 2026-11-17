Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UoH8Jgp0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tW/S6/XF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=; b=UoH8Jgp02TH9WU1ZqIGCNbqDe7
	6+LTpF0M2KHVr4IQSm5wYCB0lsxhIyRj5Ye8uh6xc4Rqo3zE2CNdseLXettb5TRUlRPEFGd3pIDpP
	YY7F92MUBqabbrAZKYjTtmDCYZIQm2E4ehaK/IEkZIibgILxxrtvftnxnYumVO7tvTBLWzLTFyAqB
	JMkBH/lUYOMbDNVd7nsv+EfY+3QyJpyPunPYfSpr6iwNj3O6CUhYsSuUgvwhU+kcI7vm6nONWSbej
	by+TxQDZmcX/AAJREP7dSng9e81ArM2GuZswgYDP4BJk72N88AgA69Xg8t6tDVwsinTCc+jdOOCYA
	7IYCfj1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCy-00000005vSP-0lfL;
	Tue, 17 Nov 2026 13:26:48 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCs-00000005vOU-3I6b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:26:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso564157a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922001; cv=none;
        d=google.com; s=arc-20260327;
        b=Ys3SHnhPU+uhoVOqdv4+apAS9FYnE29C2ByvdaSnvlCuweYn04sGJGQwxjvQ4/eo1+
         zQWqrxTFRaRIKXCohtlciy9GAF8GyPoa2h5cozeZnkzdzJFOdshFMxCnn3WdUhXxD8VR
         euVH5wHTRb3UTlHB74BJjp907FxZ/JG0+XVHweYI3H5o24FL/dOyj9NXnjOpk0D0trgM
         U6Dmtz73/bmwXcfq8QunFfbv1wDMdGN49qEPigvQ/VspEwk2YHHALR6RxtTAwph4Rhvs
         d3tY4rn3qC8kcE27i6Dfrhr2RQdWOBWCZYLW/d00b6gQGtJhEoQWtF6MBDpiLvoLQ+1O
         ZfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        fh=WncOEkgmjaAyL42p4WZ1Z7hw6NSE4Q31WkDK0MvlPd8=;
        b=VNEiSKSXjkBs3ea//zb/TYoATj0unBkA3FbC3uR2Wcxtc7hO2Dy1ZrKV9aLJpookjz
         gYvtKLgG7bqIu1ccT1ZYOfgRT6FRHrhONBnorKljQu24MLemuMH1hZVeHP0CDz28qoIo
         zTIzEmirzaGUP9rbrLbCCW7eOwneJKREkXNMzO4dP3+xYxlZQBhILSirRL9rsH/kVjmS
         RIMbnIYEQ0uW1QZ2vk97E//o19gPoy6wfUKPNMKPYldcfF7WyBP8Cx326C4eRK4xoGwh
         72I33qPDx1K7g1Qo9EL0ag+ZSpeW6cGFLrV/32xles3j2LPqD7Dlg12wcHj72eBbY13A
         /FxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922001; x=1795526801; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=tW/S6/XFnw8v0ytylPRnXvtFxs8lkP5fnsN5kUim8NPlR8Tvb/StWwTIeDp1Tw3aa5
         vz0OvPrTCHtjJ8D5xp9CrLaKZwgFVJJzlh5MxurpKeclb1nrurtvTMbZHWqPG4xVaKPn
         Jv3BOx18W9GIyMo78tx2cN/Xr0bZ3fTvzIIr0I0LLxguDZlYDCTd/GMWEqLj7Bw0JKS/
         JRgWZMY9w0qG/fvlNHiI/hE0TKhi0P1B55W2O4jtWH2n76kzaa3mkxPU/8gMcDl5vgv4
         gwMsRdmlYUcMMLv4UxcCUwhMUajPMbbaIggwi4nUq+nY1G94HncUz8H6gC7K1so5RLaN
         XMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922001; x=1795526801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=wgrMtUHuQRshYoBkzk0JPJoX13QK3IPcUpbxzRij2bESRilud1/uZV01YTH1tgxDb+
         Pjk7xLKT532FQfsUgqoI4FGmvXeFM3dYXoM1OOoO5mG12lzA9WvE53nupyPvYadpD8w2
         07a4EHYoSRXfszcviuJtnLG3fgp4CD7urM+5DJUH3A1k3thW6kUOtIMRCmr6Dca367uC
         W9owZRy3ebDUbwnkLRfXfRRA6z2XmIL5WHEoZBltQCmgONepSqY2LdBX9Y1rXajKm2HX
         XuHlCSHxgPQSiZz1We1qPyPV/6zzgti7nQlYoEDdjAkTyEzwViXnkZ29gclKc/suSBpH
         VqUw==
X-Forwarded-Encrypted: i=1; AL+hErEIwcis3mRNustiZuUI8oY3ILIW+gROzyLBfPSlPYAst53ODIrMoLsZ+b/ZyhKkFNXovTMXEvkb/D0LkjsnGDJ9@lists.infradead.org
X-Gm-Message-State: APuU4Z9PAl3Z549IedexIQ7hCHe91eGD49OeQ0dzrcq5dydUwm7x6kbb
	cyHRdIGYcQ75kFgdkwDrnNRIf/775Eu7RtAXt6hpWh8+M70euBOpBldiEVgBCUIIs4XlxIwrP8+
	OQ0mTh1OCS07swbrk2lNrbF3jhN5ZHmw=
X-Gm-Gg: AYBFou1OyM/g38CgyBUB0bPy78wsMxOaquxcPAN0TIuyzJ7b3/+fF1qXIWoZVw+peXW
	dVm6mUK1HofMENb5Dg4l0+xhBxa5gjQyTZ0XqMauGynW0K4xZCEQsE/alun8PaSGwYPHUFVayHG
	WcyTdaGFjg6xVzqqLz8ukgeDcQ2jppF204tCxDxXp9EM9m1pO8mmLfVnkFyiahcyTG3hmPMdavd
	n/J59sF536nGtcEN1T3HGZPNwYglyTa620DnNo6RVN7guFFBm4+SX5DfyncEkbLXbFfwn2l6pRC
	1i1HdCQat4nrdZC0kCNsf7Zk8WkUd8OIvQ5PovHiHKIAPAausutGl+M78cXdayD/iVL81EfF0fv
	F5svCawiRs5+O7CkvInlZP+o9j6AItZQkfcw=
X-Received: by 2002:a05:6402:4504:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b7c0d06f9amr10641554a12.42.1794922000158; Tue, 17 Nov 2026
 05:26:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
In-Reply-To: <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 14:26:28 +0100
X-Gm-Features: AclHuK-pAjMxUsyMno9u008purn-se7dqQHzpp18oe2HOK5CuVKhIbMUqhDzQWQ
Message-ID: <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052642_841181_B94009E4 
X-CRM114-Status: GOOD (  12.14  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Turns out you bring here undocumented ABI. NAK.

Hi, I'm sorry but I don't see the relation between this commit you
just NAKed and the bigger issue about mediatek-drm alias usage. It's
not like I'm introducing anything new in these DPI specific patches
and the individual display block drivers do not depend on the aliases
(they're used by mediatek-drm for building the pipeline).

I understand why the commit to the dtsi that includes the aliases is
NAKed, and the eventual fix is going to require a change in all of
Mediatek SoCs dtsi. I am fine with the dtsi changes being blocked
until an appropriate solution is found. I just don't understand the
NAKs on the DPI components.

Thank you for your help
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

