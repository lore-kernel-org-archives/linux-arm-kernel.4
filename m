Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B68A606B23B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SrN4VNBv;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gy2SfDLB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=; b=SrN4VNBvDYexxO
	zGuIEzRTF/y0iLhq/XvOrXlMFQf8/LWGfEzpbmWGQqoNmEy02SvWIpv8owrPfF8Z+zWh/c1uP8wx+
	9zjOb3lUC1Q4Qdoe+p0f6hQhR5uxfNOIzSsaqe4iA7gA+VEJbtj9LGB2tsu4SvlicRkmOiZjFZIPQ
	WOjDFeSFp9fB7dk1Vb5zARkHrCVz5YqJ7aWFYBASDnR77KT7nqOsx2jrtFfTg+wTKRKuUVeSKwIL2
	u5Ymp+QzBn62Ofh3kA4vsDGaJtw2i+2x3zYDZctcBe4armr6N7GXjZiWSd377wXhPHzSrvNAzA/zb
	ABAgs1lh4agSqrLpM1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv1k-0000000Djpi-1xMU;
	Fri, 13 Nov 2026 17:25:28 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv1h-0000000Djp4-3f0l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:25:27 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-54492d8a988so482361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794590723; cv=none;
        d=google.com; s=arc-20260327;
        b=fX6tbcvThKkYpT6x2X5OEhmYoY6ZMRQZ2yXorjyiVWjDhjDQNpedoQa1I+zSWMEavh
         8VwY4/qakc46JMXwNiNPLh0dQ74yrqzGMgRoOEpkp/RaU/Zh/8Se88XO0Kz7Gm6Xq5rf
         u06IyVEJvxD6+KLleIG3xpNr3dI40GFSaLCc9c4cMOZfQk/tLpCTIDB3DsAxrEWhnb4E
         vJHIt1kap5xB9GXXSav55Rojw9EHN+UlNoC0bpVdnCga0HJM2SbNiM9suEIGZzdlOrM5
         X4UQfhHQd3FPVbY57yHg1Rua74AMzOcbTRXmCP0kI5O2b5T2sNuzRLZ5fdB65nqRkN/S
         AlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        fh=x8fAsDZ3lhhuLrAC+e4C7FbqJb+co6iTXO5/J+3he9Q=;
        b=CnK5lGVuHMjZqVsZPW5R2gBVLfDkxSErz49Ky57/5pmRKBfSVmRO6NNJv9iQrOvX12
         aUvlespzufEd9TeT5oWGfgUBFsACjZkCHeq8qSB3ZA8M1m2aKviBcbdBbjJ/yIdO06f5
         j31M9X3IgtHkO0Mwq7TDgp6uK8cixO5ZArOKiuGcgjXpwqCy65s8f7qWBkUzabdStZVX
         1imscqdzYzem4RJCp3Zv87r+OkWwWlDLOONotzpnPqOQLbW56DGpEJWpMqnRVgsQjl+G
         wSHdn18iTWJfZvGU4KSMofRDLm55j9nDPnfJb2AEIvve2AH3A/Nkb8m5xsA4QxsArLiT
         DbgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590723; x=1795195523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        b=Gy2SfDLBm52kaVw8Pwtxg520vJisgfmObzbzVqOOKtm0YUSjWYZXljSLkHvqoBoZa5
         rHdgmRfiKKPva3LR0ydc2oHqQ407LN1mSBkpzMgvgyWpcZhOp6Nnfw9juexCa1dPfhJE
         nT8MRWVuXswu5FsjXz1zxSBBNlBGl1ovQAAAD/HKcNDxOopWM20ENEbTumaj1BB8P1iM
         Y+m8ORGDc8dpUXqlxhETR/7/+f/NHMlYxk6pLzx9lxSCCFknv+gS8fXE7dSWy4EMO+hY
         jxFQJtIg7lRebJ/0sPyferGIK4F8MgSzmMw8B4NLNT+Zo3zkkGUzd9+f7xxETekP13Zk
         mOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590723; x=1795195523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        b=dg14cfcBK7QQ0W1WR1A2bJKuUbLrfbAHG2MJtScwUrGPrIX6MZLeULJO6jcalgn+NH
         XjJ1imnH5JlOZYhKHAolZSxASKPUq5z9uH4xLMNFGF1475BnbYYaLnUhVtTQjk1fqOIb
         pXRxdlJPO7HNUbz4yzqAO7sDhg8sa6zath/TSPKpgzibt1bf8VD4nyEZgDnBUDtKk/2R
         sYbAy9arOf8rTTHQQBnG+r4c6Q5UpqHs+yHl2s13/T9RHt4Gw/h+Sfgm0yAXcdqUV7/I
         Mtiu+OnZlODR0KXvmtCTC6RnS4aCOgx0fIis3UkonJ0WC51i4v9FNC7/jHdIOSWNozFV
         CsUw==
X-Forwarded-Encrypted: i=1; AL+hErFZaSRsXO19zuuSL/xpKloxGHUaKEW9A/mc1qOqECdNgg7gQYQSnFir//sCD1q/a6U77UUA3/TNACAPfGiR6YbB@lists.infradead.org
X-Gm-Message-State: APuU4Z9S5AjHweZLeN00C2/iU5bokavPTdtWRbUDeLYgpkohb2mNAABN
	iFXHGq4ROI4xUTrMDD7nFbxaZL0GQiNAETa8pmfoy5aEKirJ0FTNFYGQ4D1J5aTJXO/ns8H6TZz
	lUMLywjtmPiWf77kCDu7nJ93QBsfGq60vOAOW9u3E
X-Gm-Gg: AYBFou2nLWFOFiVatq+DCdPkUaU6JIScottvEhywr6C3dmFdhdqk1c8fsZ9ScPxuCZr
	+EaqffIXDxGM4rPcEVNhDHtR8/83KXstuCnjWstRLHtAidz2HEsS3tGL0MYNhtGhGxFclN3T/EP
	VTA9mW4+41dWV+wBvHYv+Rv0Ctu2SzSXRV7kLVLjTCx5PvCEWLm0mJFSOrwH92cOPEyov9Q89rQ
	FAA7IkieavfSnyHauZCR/GzOtXQwL3O082Xio5T+XVoqg0UGbrDPKMSFty3Z2OeHbsyypofVKF2
	wVQs9DqvRZsHhwksBIAxWLc2A/9wZ0MsaLWIzpIQYfMAhh5mwxy98EZxLYJPXK6zP7kykq9akQ8
	6+hDuP50HmIisMQgjsT7Xc5AZ3Q7uEWOQvll/KXzo2e8vKm8dqpwLBDejnqhMSQj9j9vX9a1Czd
	3EWXOyrUc+g3ZzI3P8twqNWnpk
X-Received: by 2002:a05:622a:1c16:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-55afd32373dmr16424331cf.13.1794590722631; Fri, 13 Nov 2026
 09:25:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-2-vamshigajjela@google.com> <20261104-rebel-kind-rook-abaab1@quoll>
In-Reply-To: <20261104-rebel-kind-rook-abaab1@quoll>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Fri, 13 Nov 2026 22:55:10 +0530
X-Gm-Features: AclHuK9IMsUAoa9IqlG448fs1zfhKtF22rMEISKsShaTjjacHR2eqg82hFisGkY
Message-ID: <CAMTSyjr11ZBqwhnnKpmw2tcRirvEctBOkO9AQeG_sVUW79Q0cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_092525_924033_3216450D 
X-CRM114-Status: GOOD (  11.86  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 7:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Nov 03, 2026 at 09:56:05AM +0530, vamshi gajjela wrote:
> > From: Vamshi Gajjela <vamshigajjela@google.com>
> >
> > Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
> > Limited.
>
> There are multiple smartdv companies with different domains, so I guess
> you want smartdv-ips? Or maybe all companies are the same?

Hi Krzysztof,

They are the same company, the IP databook uses the legal entity name
"SmartDV IP Solutions Private Limited", while the company operates
publicly as SmartDV Technologies:
- Website: https://www.smartdvtech.com/
- LinkedIn: https://www.linkedin.com/company/smartdv-technologies/home/

In v2, I will update the vendor-prefixes.yaml description to
"SmartDV Technologies" while keeping the "smartdv" prefix, unless you
prefer otherwise.

Thanks,
Vamshi Gajjela

