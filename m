Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23256606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQZNZXQ8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmVHxvkh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=; b=zQZNZXQ8n7k+7r
	B7q7bM5bzlcLB2ZgDOWha4mT4+007bWg+3KwhqC0QMdTl3RrxkhQZRjzhD9QFIRRH8Hh3UWK9zoac
	lmwTbSC95fnwIsOJL7nUUUvcSyoAGl3GUrCmB+X90f5/myZlqxhsox8OpMe3qciWhKro43nAHCDtP
	OzfcFc4GH4IVg7UxiGnGSbzbHDTwCr3hfkrfB2sYiLZTfxWKFYK3OeV6eT60UG6Y4rfXzeAcdPoMQ
	21EzLJp49+RtcV247Z32toytCfwQnFnNu+HRNbSgY0DJlLlw3MI7fUtBE4//K+VDb3ZhJKuJUDKnn
	tIhITc/IBCuqw9rfemTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlgH-0000000EmNP-2uQc;
	Fri, 27 Nov 2026 02:27:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlgD-0000000EmME-0ATo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:27:18 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f0918f9e6cso21864025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746436; x=1796351236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
        b=cmVHxvkhe/OM0ymThJGmjmuo/VjOt2j8RbBik+02YuMVwwI3YMEQZVlhbWfGjlYmPJ
         7un0bXRoIO0oPVemlvTawO+YCkhwtD7+ilFJ8YRQZD0FwyQWLbp7mUI4EtRtXpiKAuvr
         teHLK2h75GETymZdJD/MHPzFV+tDwUNt+OEvV5Ru3zhx28GeuoAmAzfBhqfsMtVW61fT
         extmVGDZx2snb6vKzeUgVHdLUOuYZu4MfOREkeflMJ1B5B+CUM/U4OTT/P0wj7GGvz7A
         Nuuri4ndw14ixESamdpDlllWG3CHIR6UVH+WcDxmd+rl+qarY0pwVxwX0p9t9fiMJsH0
         KX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746436; x=1796351236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
        b=0mepleTW/1RdMmOTc1h3vpJbepMU11Sl9kquwtscHhNMLDYg4Pr9Rbjdq+lsQOGwnZ
         pSOqqvLa0N0z3zI6F9IE2jOQvaxff1+fsI/+QjnWGJNRmF/M2o6bzxkUBUqLk/xEmF7A
         hmjzpyr6DxlhvCZhzDeC8JCBcdgdvemnyDPB6gpyVrPaVV0E2XZ/O9uAt7MZpn68y02g
         0ysHWFGm2cWSA0ZWXYvD2wk4jboDSzjCWOumeqf4IKE49HWXrjRrF7Rz7iOLhSLuySx3
         SO7rMubaPM8FPgAqNNAGAYgHuT8M+JCcaPqE0QYUfJ+5NU7Y+OE/vQOvnVN0CtXS1qhV
         6OUA==
X-Forwarded-Encrypted: i=1; AL+hErG82l4uFP9tZcPkcy8Yf8+8n78DHSPUG7sKw3AkkEbDylxvIeGcuE+ak+xnQzsB4iXtsq+0wX45+dW/qCYEtTFf@lists.infradead.org
X-Gm-Message-State: APuU4Z+pLlkwoY2wpFOz1cM90G61uBHdTOqkIId/M7wGkZn2yYAGIpJd
	S3HLCR0H2Bdg9gTT5PXNLdeu0fyxSH4suWObT3aVVAe6O5SPrJGwl1Eg
X-Gm-Gg: AZFdTZeAnDoIq09xUlyAt3SQuyxWBybBORm1lYfVfhhPvmPfivSGtznhibRACbduSzY
	U9rmqttvgLd4faI3/ugbtYic38zkwfw9/UYUgnBIVT53pnhxXsduSdtbn8Q2NOO50YDoks8lTas
	hkI1TTRuoULFkJdhXpAerCilKftP0/rYiwSOyqUvAdZcN+a0Jgh/RhhqJ7vMalYuDJ2iuUNDsQY
	znwrRChNHzjwL4EyxGOrF7kIKqsjH76meUGzVhq7Df96MvymcN56zlfj0Vta6JnIS+E9r2tKS4C
	5H72iyv15OJy0jUBw+/9/9TpKFsFhZAJnHvc4PTtIHa8NI0HdLiV5qZORNcMdQimKd42YNeGOnl
	QX2DivGFGpVFr3l8ahUpzP66o2aoazTeWpv2fSkdg27M6ufyEsSYkoFfSMEcFeKNxJvmgQihT7O
	Nn7Vfyn8FpGqH6EdGCHsaNj59rX4c4dbZXKqpLIh2qF/XQW1B3Pu0+nUhGcdKDsEi+LLnNjI7E0
	GPPZ2bBA4KYeGBuTp3W0ERLDqbI2QQhs0RGotr8Hj+EZE83aVMK0732wXYFn3vGz/kQfx0eYX2T
	bAknjcvO2EyaILkxcByafCNVcwkRB3sz6oOrRfVwo4lMuob0vomXZAhTU90qAQWfiMVLtmTSrOl
	d+C471jM=
X-Received: by 2002:a17:902:c40b:b0:2f0:7db6:50ad with SMTP id d9443c01a7336-2f07db65335mr158745195ad.18.1795746435838;
        Thu, 26 Nov 2026 18:27:15 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm57903655ad.45.2026.11.26.18.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:15 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: jacopo.mondi@ideasonboard.com,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: pisp_be: Initialize lock before requesting IRQ
Date: Fri, 27 Nov 2026 10:27:10 +0800
Message-ID: <20261127022710.685062-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260830150045.2704062-1-runyu.xiao@seu.edu.cn>
References: <20260830150045.2704062-1-runyu.xiao@seu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_182717_080703_34677B3D 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 30 Aug 2026 23:00:45 +0800, Runyu Xiao wrote:
> The PiSP BE interrupt handler can schedule work that takes hw_lock. The
> lock must be initialized before devm_request_irq() makes the handler
> runnable.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be fixes, by rebuilding the
pisp_be module.

The driver probes normally, unloading and reloading the module 20 times
works, v4l2-compliance -m on the pispbe media device passes 400/400
before and after the reloads, and there are no new kernel messages.

Tested-by: Roy <rongh7426@gmail.com>

