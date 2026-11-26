Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B54A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g9Z7sKq4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlSEL6Mk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=; b=g9Z7sKq44pFi3F2CW8xN5ddQrY
	lR+Oyeb5VM5QLw2rEBVBVJPrEDev5oJTiSqrNcocj1KsYlu/6+XQjXjnBHARBngWnUjqAMoQgVYQa
	Vg8Rzbl8xSFLvqEDOFkoTOrGDExPWDM6hsC+LjJTmDyr1VET+lR6BdpAhJ+dmjpNhxJ5Xi/42u+Z+
	CqXNlUbLGKUeLZjr0RKRQk4869EyI38DBcs2t4fVCYmogC1kS8/gAuOAFCYw+wNmHtqLVN1pweRSS
	zUEmMX69VriN0GmUHyftf0dINiuyvcikl1pl5mYk7MP5yJGdKt7JrX0zZ1BNovK+Gy9M1MxrDKOTB
	HxAwL7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNMW-0000000Beml-0jNv;
	Thu, 26 Nov 2026 00:29:20 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNMT-0000000BemJ-2yBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:29:18 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-386c71feeeaso2783648eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652957; cv=none;
        d=google.com; s=arc-20260327;
        b=qMvAifvVz18frErD9F9hn3Q3KpWMFWm2sGFsc2bte+RMlly06ZvTeGNokWOwFw5K0m
         LnxIkRLcjZvbIY6u1VvNjXkaDxg5DBrjJcJZ9fPjq6KyB2jvPtY7DighW1TNmN/X27AP
         4l4tl4oPXvQb9KvGtisuBgsYyf6yqlXDgS6zhzEMI45ypDnH243xC4OnjEI0x6pFjIVt
         4CMZInJFPyGT05rL0iqwthn2GH+xr0Gb53bVVrAeLdOOs61q9j7PvyxDz8EohhzvhmLs
         gr3IuVF1Gap+unp48+n1WmtBOn7ph2mjx2gFRKuj8s3qbekm9CZ5McBd/eNfoXq7fP1o
         ZIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        fh=pvaUwOfaLIrjP3j7dcqIRHtSZAqkxxwKieC707KbrHs=;
        b=ORMVQG1woFFIDaCDbEaiQpvWMhJNMWrIRxgMMwRv1a5uK4BFeZAzS7SFKntnVWl8Zx
         lAhwdNQD2WPNedh3MJX8XPWGmlK32T+0XB3SgIgf7BAVsltChbhyRfQsVnXiZ1XRxkAz
         krdeRKq+hZMgO+L7blvc5p8YPJs+1K8m9cHH467/NMDy/KTmlUwPzX5n3NCYz+NNWzUZ
         4IM+OIGZg6DaSsal7hxppzuswP5O4FnjfHTOKZWriSWf5TXt6+A6nnpCQo8D5QsHPN0O
         bqHhjqQXWlPb/A8NoTT/5VPY48OOVg2HpUoLda46bPJy0mVRohQJhvndIHQQQifS2iFU
         ambA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652957; x=1796257757; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        b=dlSEL6MklMNxl+GdksYamEBWP6MTHNaMwXgzkXDeGqyluMpoKbD0PtqcTaFMgx+6nX
         58aYCNlJMCWF/DRVaK7mcIrHqM5a84nrgF0kztc3vPmv1ctjN5lIW31H35aSaxRjSn0V
         fbIuLopO7fzm8sYtNamc8knpgMdw6mWEU2EUkF1cKU3Cy+8pouVsbbHtolygq2XQMTZl
         7AD1sGO2GMYi4dgVsMiqW8VAt/kxyGueauLzNF5XjqB2NydYcOs1mQFuJpUUtA625NdH
         1bWCv6jBVv/oU79rZrK8TgJbGmham40is4VQO7AiICfKm3qasAKKhX/I/qxVbNtJUFmW
         cOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652957; x=1796257757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        b=NG+K1O+xfRY5Vu+V1LniancHokT1v18R8ZWT2LtOo7fRGNHLZe3wdpOclRAXN3ykXa
         +W9FgxtRgPS2UWzKyT4af6wYlltVt5cJozNfnYQk9EGvzAWW/XlOG9LXZrmu9Ia9BLBG
         HVt2ZlKyEwx9JtTnVZE4USWe1x8aUdpFeABS8AObqjbORR1db3aGrtcXMGlXtNws1GOi
         HOJ8V+cU/a+zSA8F1FHFqTbJITGPe2LQY6iO3djrsX/1v+/Ia/czHfuIf0kgUgxQTmq8
         cHv+Gf7+kgOjlwHEJLpm2zQkYLLcUGEjdmK4dZiEkxNU2dsQNTSuxPYDreYBIgA82ini
         rkEA==
X-Forwarded-Encrypted: i=1; AL+hErHmO1UX1hgq16xBZlEUsMVpceeWmYdwdcRmrMKX/zJdbKL2NeDQwUdFRQNEjpFX55VGCQ9owKceu2aZZKcLMeTQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9VTP6ISQJ64Hr+o06VttZKqfoqkc+3fFgKx/R/rC60GfdZg01T
	6nEb4VfIygkDFS+RPO9lEKusSsghK6827jYlVXKdyOdMrl26RprC9HIWqNW+yIP4CDWCU2ykj9A
	pSpLOcObLh3ZHKhld+XsHB8wrWFrd/oQ=
X-Gm-Gg: AZFdTZdUoye3rQsqJQ4rMBqG2mtWGPFVcF0N0Hyl2Xuhjpz5O+e1e9g+l1QNmzfLv4T
	QbTHWEHWgf8JRDxy3Uc+iCfFWTSNcDsXbu8jjeJOOdXhJCUYnDz17/zaS5NZtATYi1Myl8CRszv
	2m/aivF8d6k3uxoSyHx6xTuYzc0wmsbvGfxpgL9sIQsCXC8RYBTHq+huA0u7k3DfZ2bfnhHqiil
	L17CY6KvP5/2nBo/+xRRIJ2e57ZD+v8JVn/gAuAYzltfstpANEicQ8GOsAicJ5LpwqrJRTtNhbd
	+Dug5JmDp3+knBJUxQOLX8Icsz2u0nhag8gLi42EuSW7wfUM4UyozwWk4l5kuvvULDkypJ5UmV6
	sR0l+/3zqfGarOvnr3vOHrrKLCx3K6xnVxsCSua4=
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id
 5a478bee46e88-38571510675mr21743896eec.33.1795652956755; Wed, 25 Nov 2026
 16:29:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-5-prasanth.r@lineo.co.jp> <awdYin-gfFlMzm5K@SMW015318>
In-Reply-To: <awdYin-gfFlMzm5K@SMW015318>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:28:39 +0900
X-Gm-Features: Aa3M54ppWwPKU2GXBN__reMNMjMzYNk4yHpP-osEJU5EF1y5sgVMcffyz3AkPvI
Message-ID: <CAG7eodGWsRtuQWgN5=7c7b9E7JKhLXAhZxRGgbDW9JpkSzhX2w@mail.gmail.com>
Subject: Re: [PATCH 04/12] rtc: mxc_v2: clear the wake IRQ on unbind
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>, 
	CL Wang <cl634@andestech.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	Prasanth R <prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162917_748386_6BFF5E0A 
X-CRM114-Status: UNSURE (   7.37  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

> Needn't it at commit message, you can move it after --- to tell maintainer
> you use AI help.

Sure, I will move it in v2.

> all devm_*() API need check return value.

Will be fixed in v2.

Thanks,
Prasanth

