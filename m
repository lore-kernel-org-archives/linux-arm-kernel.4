Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IA8Hvg++;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmrAoumH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1JUW+WKauvIxBw6L2AIt5lHW9i2bC20mGhN2YIQZ1Ls=; b=IA8Hvg++HjJGIN
	+WpTkTTSp+cHaPIvHXIwb8/aQJTjAdd/VCqvRndLSrStZZQ8CZ1mq2704BDZZZUvQM6r7vIUkfmaD
	IDxD0Mr/1qoCexgraPQPy91tOCUoKZuiZObUUGp4By5TKfSRc1jSjGDHtC/9o5DJn4VGAOAlioulm
	BEFkpyeR0kc1H0UNas/NpAvf8UOxwaFSca6kivm8saLyeBh0t5jFNc/EgFC/48ABrgfGYa2ANSMUL
	1viPMnL9j7FVPXgCv1JE5BgIMKImE7ysVh5jCYb2z9QkJ2Yg5Qyi/vj9qLgqW5OvMSqhyXpm+sCCj
	21BmVQ9t3qJ/sjW4DdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC1z-0000000Dh60-3Lbg;
	Thu, 19 Nov 2026 23:59:07 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC1x-0000000Dh3X-2ELM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:59:06 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3282db206d3so748775eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 15:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795132743; cv=none;
        d=google.com; s=arc-20260327;
        b=eVNrYxJqBp3XV86VN9uqI2klbLGFKsfoZo9ZKmR2TQtnzZJSU7EI1Yyby10ieZPM+d
         c7FX7J+UojsvbVLiZRNCLIRUGaGxN9IfMMFIlqYDZx8We9/XO63cj8tzvshOD7sbUJ0j
         XIu2XHbh2wqdghQbbb+uybUcSqhZGvTmuO4DL50tt9bLbUeiN4NEfu8etoQpHAMXsyk2
         CexyBfPd4vo/G+ZCXTYcZ8TJJz84HVmfwATAk/vSwrPHATwLzZCz85YtqXV0BWxoDAck
         ed+wq49rQkzXm9M/8gmAxEooOW+H/5D7594UYdeymb6r2jCzSkO7OLLbWnfpNoN0Mksu
         CmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JUW+WKauvIxBw6L2AIt5lHW9i2bC20mGhN2YIQZ1Ls=;
        fh=fuIH6cfxg/aECCDrAY5Elh4YjAhLfYmpc/wy07NUjw0=;
        b=sOQjRt5iBRPXRWoKh9lkFiM1NQO08iozExzGVEPArnoIX389hjrvl4PK2RBbkCn98J
         ambqtQ/91mt3OFV/n5uSZDDuAKMXq6kfNWDgwD9Jwpjbe7SmYKqlfdC73eOgxMvbnVDH
         OH3oZflLgKd6c15Qy+N/lFbfjusK5RGW4D9MqRkhT4tEDnM81WAwJt8slT3vbn60jcZQ
         HTXnfg+T8RMeZYNPv7Kwx0NCd2sHxbRHxnVUKl/QgJmE7UJdqu2uLUF8k6C7mFScGNxy
         O5nJftuNIyEPW1Z7xzlfmiVFR/De6zp3AVFjqHqGE+6p+BmncAzgo5ggrAMvNIqhUIXQ
         y/9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795132743; x=1795737543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JUW+WKauvIxBw6L2AIt5lHW9i2bC20mGhN2YIQZ1Ls=;
        b=AmrAoumH3Ng19japo4s8tfTidHsN3dJFpVOWIgkxptoXrAYvwayMVPwph+bVFWT/dY
         UbLRZHRt6TlRGRRI1GWmlfUupnGZPfyUFj/YVKV3pwKjLVx5GtCn+PMcFQERMmV590bX
         XPLxcgM2+xNC8wonFXZFRlBEHdS47B99b8f3CQwiggPz4NeRfWFcia5572uHy/7SkPPD
         /jXkt02XICsGqHfxfo1YoRJMdGp9joc+KIHZJx+ZxCiixSrIUplFCLFX68Q1pdps5rqF
         wAiZISmmhaq2N/GaCKVlGMJAIq7WPkISKdUpW9Z1fccqYKlzgHMzc/eEUCwu2/9ITijM
         /TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132743; x=1795737543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JUW+WKauvIxBw6L2AIt5lHW9i2bC20mGhN2YIQZ1Ls=;
        b=2Gg2RDDoAXHdKcrYPGl6k/MGHN8I2MeiCOW/VKkFFP+SQ7to8avBBA7MigrBeK2mRZ
         0t0wiYnl3O9z/FiN9cPlWDFtO9hK5/wgDVyJkQJe1eBKqgRKEz9+jqhqEkP8jft+IxG7
         odVQnPzf9DBBx0Yl382YBTkBB0jcHuqEpfwkgf8A/oGpfYsRU5mqlHRMBE4Ms6hpaduG
         XlVgQbdA1hSEP6qCjGLEtjRyTO6ywDSlfmqK7+ji2RA4L6/4zNrJpTBp2l8WhiViAUdL
         MMrc/5A9cYFylrYq1FB4p6sWoBia2VcmBYkaMDSicrvVYF3T3chbtF6d4KIh7UEHXOfW
         qQ/g==
X-Gm-Message-State: APuU4Z/iEJ9PyeOMN7gcUpCd8vzN4dTwpN1DfMCqGiLfhXXL7LOHf4uX
	1jS0314+gvJka51g0eHcEmJnPsSPM1FgYRE26rttK/q1apFaaTkzwZu5VizYKn3D+vxinqwZjk+
	H7scbssf47CwaYDJF5l/+KRgspygpj20=
X-Gm-Gg: AYBFou0/zGV+f/2YZ+LpGD58JRLfrpVycAbMElQyNK4VBFRd9iwQO+eiHmKdDI2K4yW
	DjeBk7WXYb88ry5LJCEVYkK4X6eVR6ry1WAwyMiS2zAtAqbv+kQtd0zyDhN21Xd2Rg6ngUtvxXu
	+Wpo3IHU7SmIBKosBrLAAPB5+IfOgfrMcBqDsmN3zOepik4S1jcI2yCtpS5z/Nkwzc8TmVBM5JP
	SDxy5g2xK9ylHqB4kJN8n8ey5M0fymSRaxjOkzStCrEaaBVtBPmbA2+8rBVccLHaEKNSZnRrTCG
	xVEmhNUupEEdYShhaNXhvQdtlVpJOo6ugl7mcYToMal9E/v1iXN9YjnfnidK4eyXg9XHlNo5p0n
	KwS3WbnNzrywgDLLjX3S7zmY0JWM5qI1MS04RGN8rdqyIVKDF2etoI8eWVSqzwr1g0PXyHXs=
X-Received: by 2002:a05:701b:204e:20b0:1b5:2717:61df with SMTP id
 a92af1059eb24-1b556913aadmr1235458c88.41.1795132743396; Thu, 19 Nov 2026
 15:59:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118183335.1944213-4-ardb+git@google.com>
In-Reply-To: <20261118183335.1944213-4-ardb+git@google.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Fri, 20 Nov 2026 00:58:51 +0100
X-Gm-Features: AclHuK_id8KfSwFz7Hvzaa4iSYOjF9daN5P0Ro95kxi2PxfTBsmsJzUNGftauow
Message-ID: <CAOLeWCuVdqviin8QTNHY0O1O8FcpqUOm0c6Xjni4J6RzfPWiMg@mail.gmail.com>
Subject: Re: [PATCH 0/2] raid6/arm64: Use aggregation and 3-way XOR
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_155905_584724_EC922DC9 
X-CRM114-Status: GOOD (  13.52  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ard,

Overall, the changes look great, I added a few suggestions how we can
improve it a little bit.

BR,
Demian

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:3=
3 Ard Biesheuvel <ardb+git@google.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Tweak the arm64/ARM P/Q gen/xor code to use 3-way XOR instructions where
> available. Details are in the commit logs.
>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Demian Shulhan <demyansh@gmail.com>
>
> Ard Biesheuvel (2):
>   raid6: neon: process four data disks per Horner step
>   raid6: arm64: use the EOR3 instruction where available
>
>  lib/raid/raid6/.gitignore             |   1 +
>  lib/raid/raid6/Makefile               |  19 ++
>  lib/raid/raid6/arm/neon.c             |  44 +++--
>  lib/raid/raid6/arm/neon.h             |  28 ++-
>  lib/raid/raid6/arm/neon.uc            | 196 ++++++++++++++------
>  lib/raid/raid6/arm/neon_compat.h      |  22 +++
>  lib/raid/raid6/arm/recov_neon_inner.c |  19 +-
>  lib/raid/raid6/arm64/pq_arch.h        |  34 +++-
>  8 files changed, 267 insertions(+), 96 deletions(-)
>  create mode 100644 lib/raid/raid6/arm/neon_compat.h
>
> --
> 2.56.1.708.g77570a6a1d-goog
>

