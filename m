Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF027606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IrLN4Sv6;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mCHtfvzY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=; b=IrLN4Sv6tLo70Ww/2c1+EwpwbH
	OWMF0Z9vPt8QXKalKeyFeWwkpRoiyfvxqzDLl0vjNgRcgiCe1uxspJo3oTDpp951xNs8gqJRi2cg4
	ApRa6dwgtCZ8f4b7j8cWoITWgosZMKRWOniiGROV40hpzgyvnwOG7ig3h3VcmyRp/2onwWgI/KqDG
	voOnfehlRkk4n+nK1gSAMXx8reZMwn2Uaia2z1Q2rycg0GoZPdUQBfmQWXV2nodcgVsPNRXiRZcNO
	jfEd576aKOqV0OIOEUsfZb68zPOPWZZX+03M/hkUSv3difgXADsj39IK0N3UlDqoQQ9ulUGzQIWHB
	9kDz6/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKRj-000000001iy-1Jzj;
	Mon, 09 Nov 2026 08:09:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKRe-000000001iC-0NEJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:09:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4910b863b84so336847f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794211775; x=1794816575; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
        b=mCHtfvzYGI2K8dW6Vq99YyMauMxX2twECbfje2FPUnXHBnoSj46xIKs/Q1zZ1oNwUb
         32ATO8gMCBJRjMsJOL1U9jDWQeiO0BDzL+kFdIKav7gnbHuZ5oaBdz+XWETZTY0Q6jVo
         w+bOXrH15ZUUe31y4NHZbQzPXxcTmiUOuLfiGyNz/pnpFXo6dZPGQm9tcAGx/ekT7fQC
         0j+s0AKtQLHTqCe01Nn1ik7/lieA1i+A1gsNauUM2NRuFvLSvKAsf0KUKjMKSDXDRqxQ
         OFiHRwH9eNDNjhCrhq0nMy8jkfQIGsCd0PDg8FsWjgt+XxiyGhwU7cxmOBXB66Gge7bO
         y/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211775; x=1794816575;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
        b=2nqa8VAoxv8MxMoGXVi04s3xdMts80zyZwW4NsIVZTGc1Gkaw4PP/w5zkM2PZFHw9b
         ezF+zrpNLeZ78AvDn6e0zQ6Xs6kfmVeUtA+Ui+MCRxCPkeR5QpRzrsukRugXnjIchyhd
         1Xj3Mi4J/PD2JBG9waciBianrHElmYz9JApjDjJu8X/5Rc0fuoAoK+AWUYH7g2Kaay74
         HZUSltju9UoBcJFWZhxgINlqyA2SOw8ZgWNIlIDRKFRJk4oqJgI9WoFIzdBuHGj6F+Z8
         zxB0WjyIpGLwbYHkFG3NH6lFy03sjOE/6hMuGWNSWO6uu3LeQvl17kXMCAC/hwwRuYu8
         +dEA==
X-Forwarded-Encrypted: i=1; AL+hErFzIZwxD6Z5O2bpr1i6OMCsUMRRqiVrhQrLcMCMMa5ONWF/ycLWGqu31zqAMFNLbNs/awGhVzzxdZnmR9LN78yK@lists.infradead.org
X-Gm-Message-State: APuU4Z99uSwaLG7AqIEMzdKUv8KZ78i6dmah+mIeijBEpGR21chGYKch
	1WGvjSAq+gJEMd2eMAu2dacDkREjn6+5wuJOW6U95WTx5W8Nte5hXLLcVyBd38aCFhQ=
X-Gm-Gg: AYBFou0bLHMCIiO+Y27EdLQZorNavE9kOIo+cRY31jSVCtwrOYiFnZcYEhrWH09E/0w
	c3EYrjV9FR/xITdJKVdvkfCTkO1Dsd7DnnagHM6KSPS51lBPGBKlf+4l1nTm1VlirdExQraeHo0
	+98++7yArTIlFtrH5Q9JSslbq+tp3zxohXcr5Qmp9W45Q2R3nK069uUj3bh6DoUbAxHrT0B9GPx
	068M6kbafB90Leh8CKPNTHJ1MF+I/yu5oR/DHbKbXth49HHID0tMi6rLSVqghptWv6xvjwIHlXv
	nswUVr32NGWCnyHJNU0iPehiRD+p13jIUrEGWGqiHXQ7VCLAL8kLxViggi2IKVGIn5W2gI43/KQ
	km2E+N7nnMGKUX6+fnD5iYlUdQ/zXm2A7iPs4Zqj2A1/eiRzhI70Gv+1HhMmRtChZXUZIFvnq1I
	MR2Gw/rFSs1LyXin/FiDyNuSRUAnnE0Az4Mvs3FoFmS+ak9McL2iJEvFGiEIE/snyKGUugMo8jD
	/cveoGjHNuwSnYTEQJArpsEozIrSXg1DnMFQKG9r1T0d1VcS8qnzjt4i2BsVzxhXWUoq/o+rOhN
	HvGRqPEk5D1cID9EuEXuBVHaCINW883mvzh8nzqEhX9ZIgsM
X-Received: by 2002:a05:6000:5c6:b0:490:5521:f24f with SMTP id ffacd0b85a97d-4941f667da5mr10718282f8f.3.1794211775492;
        Mon, 09 Nov 2026 00:09:35 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597187162sm8595813f8f.34.2026.11.09.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jude Gyimah <jude.gyimah87@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-sound@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jude Gyimah <jude.gyimah87@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
Date: Mon, 09 Nov 2026 09:09:33 +0100
Message-ID: <1jmrri1l4y.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_000938_141639_965F2C48 
X-CRM114-Status: GOOD (  17.38  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On sam. 07 nov. 2026 at 17:55, Jude Gyimah <jude.gyimah87@gmail.com> wrote:

> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
>
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
>
> The fix is a select rather than a depends on: the providers have no
> prompt of their own and are only ever enabled by a select, so a
> depends on would leave these drivers unselectable.
>
> Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
> named symbol, and each links once the select is added.
>
> Found with kreach, a static check that compares what Kconfig allows
> against the symbols the compiled objects actually reference.
>
> The checker is at https://github.com/JGyimah/kreach, and the
> reproducer configuration for each finding is published with it
> under results/.
>
> Jude Gyimah (4):
>   ASoC: meson: aiu: select REGMAP_MMIO
>   ASoC: meson: axg-pdm: select REGMAP_MMIO
>   ASoC: meson: axg-spdifin: select REGMAP_MMIO
>   ASoC: meson: axg-spdifout: select REGMAP_MMIO

With the change sashiko requested

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

The re-spin is necessary because the description does not match the
change, even if the change is correct.

>
>  sound/soc/meson/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> -- 
> 2.43.0
>

-- 
Jerome

