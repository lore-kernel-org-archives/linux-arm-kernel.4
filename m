Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F97606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F+NJKQBX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGP8N56L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=; b=F+NJKQBXshxk3Vg2ZT7dmQH1h1
	IFQZWZ+QIOz6MP0kAjgn07G3CZhlAWH/5v+cZlpw1ecVPDa1L3GVXFPJiOy4kiGDBu1haYr76a5Nf
	ESYTbFoSqzG20dsbwZgM35LFkvXu/F769iK3/RBM8nU+pORgtdaS0cKU/V9dL9k69mQxW+qpPXIQY
	4bEiu/V8FXSzTt4TBdtR5iuW6rtT2Q6kz9dlXkjGTRF8/8Imu1oieL9EQVfWPMfjCttrczH4syI9t
	hoAWay6F9R6+bU4hPXhqGlTITVjc/KiaB0zeqUXapz4vkp+myIdbn0N4iQZ14awmBw72es3LBb4md
	gBFGgUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRku5-0000000Bn4f-1Oap;
	Fri, 13 Nov 2026 06:36:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRku1-0000000Bn3D-1uXa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:36:51 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso450397a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794551808; cv=none;
        d=google.com; s=arc-20260327;
        b=Wwt7IFgkF3nFxYst1OQNRBCcbq0rzBxiK15qpmukA5MTFNrNmPRNWsoWxFxjywG6Pq
         Os9Z6K8pqArBGW2npqtqdT+cJ4Rf2Kq/9mRl/oMJZiOJyrGJPpMrKffERviRSnGPF9ut
         z/zuVTFANwE88SHJ3/7KJxrpD5hd8DYYkyyEKXopVIDoLu2j3TzyhmcuI2nwbksH9xMq
         NxafyrZjz9IxYyP7g7sCqWo+6veTVABYkNh1Muf0AjON8wB/qVT+KlIMvmMe/M607daP
         JyqV9FYobgSbzvRxQH1O0UStNDs++4DKceqN3BLOKhG5OQFHxbk/BdvXjPQrZN8xI7HX
         x7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        fh=bVNq6hhAjbMXT6kvDwsEDDGbq+biNKknbR6ozaepcv8=;
        b=QnBoZFoTGLBG55AD24X13h2A2iJr9aetqaRRXQ45L3cWYlqhRDSIKM5a7BxRCsGVpE
         0pBB+hC5y4a/xuN765EbhBsgwf8rgNRiR03hcRTIAiThwzhMekTPz04scbgoOUR9k1XV
         IbJvf4gn1Y4BYlVyDIjg7RUwILI5V5+JTgtuDSMKmFdzRSYyp4KDUdZDDHeI48c+MX/v
         Lctild1cmZTIn/oeW0nCuzDChrfmthDXl4rjlzstQLUk6g2hK/cQLQqKqr+gRnlPSfRz
         LsZTymM3VLqEaS+oxV1rV5xSJEhQe9ftAGsO7K3Hgx9ZyV3M5i4/VNYj2I8iYJjYPgCH
         wyaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551808; x=1795156608; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=hGP8N56LqI4/9GnzjkFxs3IdHEFUzTfXGp24Sr2e9BqGWbNYbtx8D5tldtO48wwnZM
         N0b2vVxEshk333xlr8U8r/VdsWr2uDk+RtApSu8ttMZnZs+2thNZgCui4biqJPcCBf8U
         D6Z8xQFAkiV1YkEVezDqPHizQCU6/DOw69rSErxShCo8l+d3jVFCRQ1KBei2IRqjSxnS
         rjI4Y6kCsQJ4xcAhObdmNCXuGL9wyta/sTJH+/ffNBbP64fydZ5hbvDcgJN4eovyeNBf
         p86vMRI2Iz60F5HP0A1N0RUr7lXA8p/q1xkOSaaeWg837B8IknAwmvqqw6JvSaPO4brh
         dV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551808; x=1795156608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=C8HDKVcsbTF4v1cYLCk4Wf+Jc1021cZdHyobQrdtH8ct5RQweS+HyAeaCrukff8S5M
         GJ82MTZdvLLqSlaoFN8EGrPDvSbfyf3JctCNmHu4BKLMhbyU0G//JAk/kM4MsXMNKKKL
         dpEl+Od15eSNEaISO4oA6AJhmTIwYOldrYvRkSpxhpMzElL+3v3E/jxmRIThKZ8Xk3AP
         ZzPJbVugpnvXppTEjLdiURHayacG1KfJCmhXIXYzzaAYv3Gnj4ZGc8/SImVV2u5l0uM0
         X3qOwE8zMlpMcWIR2QA0TrFgeC2km3kpD+vacEcVSwqMOMLQHP/taMfgQkrvBsYdOEOD
         ghPg==
X-Forwarded-Encrypted: i=1; AL+hErGbzuaffTWu9rJn9dxbWtGzemWJW9PMbG2cr6bhRTFibCU/7DdGKlRkBjqyUr0j/kM+eloAtM5ooXtg7QBHL1lF@lists.infradead.org
X-Gm-Message-State: APuU4Z9NiZOM6JvQOIAuwOhXD+IMC9XmNDKemc5i7LCDu9HcHQ4Eccmu
	73+RBKBP+xlu78ICXOJNbDK4TPZU96lIkZYvDZPpOuVLB9z0FpFscxPepbae874OcuoP2frGTwj
	7iYNkCZEzZouMFM8dym3C2KUabTLP89g=
X-Gm-Gg: AYBFou1M1y/Ub+doXQLFs9PfA+7vg6EOGIAXA990ubAb+zHGUASFuqpzZtN5RizA6KK
	QneblpUVi4i6iw31vC6BjNGATsGowjZYmPJQNcgUnYUIeubHYkmoS8tYjqMup42sQaT6kP7JFaN
	KCH9bYhGIYzfVY4bP10+fXtqHkc6KqV10TppIEZbPiIsAM+eCrRq7KB/e8C9uWOplQW5XQ9TqOJ
	yM0W4RBeCVEm7ic9a1KA+4+0IFOWcbFMbOYjtcDGrxfo7B1oldc8QyVNGtH+GtX5VkcihY5ZrFI
	Rm/WQ4wl9yQbCoaX6Fe9mgZ6c5doLTKl27tm0b2pMkoj33v3YSviZe4js2HEYargPwgNykQrsNG
	clEqmfxVwypATOg/yWhAf/SFtKSQh37VRhWNP8G92Wd8Rp+2v/5+PLGqb2Got0REPr6cR+iE4qI
	z0C5By2GddjqyTqQw17xL71Fve8CWp41ZX1ogXrNVBd42+Trt9WFifOc/++SaCkgyX80Sm2g==
X-Received: by 2002:a17:90b:1d04:b0:3ad:8ecc:5907 with SMTP id
 98e67ed59e1d1-3b1b0b53d55mr1291888a91.56.1794551808035; Thu, 12 Nov 2026
 22:36:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
In-Reply-To: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 13:36:35 +0700
X-Gm-Features: AclHuK9Tq39ygLippNfyQDEwgJ14gA2IrkABaa-YFSuCcV67ahZWzbVvf6oujEw
Message-ID: <CAABR9nGLAEoSU58+PCTSAjTG+Hn-fDXm6vtN6_omx-EH795LrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_223649_506303_67D16580 
X-CRM114-Status: UNSURE (   9.54  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thanks for fixing this issue.

>
> Note that the issue root cause was also detected by Sashiko during its
> "ASoC: mediatek: mt8195: Fix HDMI TX startup error handling" patch
> review ([2]).
>
> [1]: https://lore.kernel.org/linux-sound/20261109102536.357134-1-ghidoliemanuele@gmail.com/
> [2]: https://sashiko.dev/#/patchset/20261014112752.683032-1-phucduc.bui%40gmail.com?part=14
> ---

I wasn't aware of the issue detected by Sashiko,
as I didn't receive any review notification for that patch.

The fix looks good to me.

Acked-by: bui duc phuc <phucduc.bui@gmail.com>

