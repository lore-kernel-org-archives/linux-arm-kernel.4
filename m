Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2D606A888
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cQshyLRp;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s4fbT3MT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=; b=cQshyLRp57JWz1JAcgTjniIGWE
	yBGUHDAmbxMgXrKyQXTDb+vQYPI3ftMA6M0Vl0IMHFdTFrb02EWtgSenUq2qWqlXJNFMhmVJUqBs2
	ARDR1WmrA9EYcZvF7t+phHKP+NCVPLL0v20r8AYHmBPyQrqA15WxbVYqw1h1ZBcPg6fyQ3KDAaKjP
	AjyuVK/Ak+/FB0UTWByewh7VqXxd+s5f2g5PXPGUwhWdWw4nnoV+Axn6VHsiVhfD14obFOUaQv5Ox
	YGx9jd451sple+pAQ2QwCzbe2bPUL0buCF8aSeHPVUc5zxdo7ZHUVkeg8oDnHfZIXhunLlRAyGMf+
	+ySB3sIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpQ2-0000000CXFC-0zsA;
	Fri, 13 Nov 2026 11:26:10 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpPz-0000000CXEn-1yvY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:26:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso108469666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569166; cv=none;
        d=google.com; s=arc-20260327;
        b=NUWkYc6OCeHFIcXjVuvjZIPwjZgeYDe60KwvVaGxCbIyACWzva0GC381Q/gg+ew/gx
         H7/VT02GO3uOaDmmw/iThOO84oEqRNO0Wne+8msiGB46JX38qaoHy7Y/o08PMfOx3zqi
         pM3KqjZBK1Pa2VQSPjqEgFmqpLuF5py2cGxRyCJDWo6870+cbkRDaxS64Bfycy3WOId6
         5H3swtm714gTIGrmveaHXRGIWrPahNlpmufoqjApwnwmdJ4GS/ycyWyKzC45ufV6K5NZ
         BbSepQXqxAe+QfEzhpYXRRRECX0RedviOAYTIh9kjDDi/JEZAwugfIyhasNPHvVtUE3O
         HHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        fh=ygrELKjJsh+C+p4fAgTPCrK/l31/iWLwJltoFYfIWSc=;
        b=jX08bVpbi/gx0Ec+pmbwPyQmwofBwP3nOqq5f4gDzw2dL1J2Dcj7FpPbXkVHs3h5uC
         hpJL6F9hY7i36+CHxdqE9A81AeYOTJimmmyOJh8BtrOTmSqSKixdPtuV7wc3/CEIv1xe
         SwbEdiqiIQbIAgsjvtskF0cH1jJcOUTvyKB2ZzhEAPYCDgvhnCGdx3yjNJxYEpKdwfBJ
         oV2lnGvdoTBeYVicslZcwBCtDKkxRyRG/Ol+DefncrmIJuCzXHQ13Ut+xGdtUlfnoWXp
         YySCxNwW1JyDEv3p5Ep+p4Kte4wBf113XAHBYiqbJBM893MOw1glkA3qXqvBixNfhHHv
         PjqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794569166; x=1795173966; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=s4fbT3MTGx7aGfkuAg26BNPmWhbhs3rXzXwvVDfI/EsWaNIYsIKm/GFqHn50cZon1V
         fOJLXfh4oItHrXO9GI6I4T2CHaLMcV5srhq3In/oqzQX2vUApbfBxNn/bLoDYsxyStKn
         QT7wRJARn0oViqjNryZo2LCvj/QTkBooyHsvsDJndKu191RhWt0KemTXnZH/y0gfBTGd
         +wbknpxQ4Bs/0IFyZMliIP0bC/ccoui7UYdKDEOmjTRVUkFPookhb8UVtnQZqrCtuuCl
         oAjO1JIz6VbNK+RJ7Jd0hC5V/xkPuJDUX/flaeMJwXXBu71jGkqku6QQlr7VrU7ZtTv2
         RMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569166; x=1795173966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=pt/hHqbH85xWNTAyWkNlsuLNBRMDwgAMbo4n9QsMpwemublrEeGGlcMJdvBXyylQB8
         CeGzxvWeFIB+ySva2aroLAy8J8vXYLWJ0dvUU4y9n3J/4PfSgJJ9t9vm13OFl7Em7rAe
         hwY/q4p9HMNClcpHtAAz60c8d9Q66MdCwdahUgTgZvGCMw0/b5dw4EICSbjVDfHcu8+I
         0wYdbCcY47cFfa4bH3UetadImoGZChM0j//ipAOw4mIbidNGCFvnQysX6W/XVgf3SUuR
         2/ceC1P7iv52wSC74YffqGtscs5Vqz2N4mxnaMGjGf6+ICHSxQcQCVvyB4JlTlSaLFvk
         bynQ==
X-Forwarded-Encrypted: i=1; AL+hErEpsoU/AmufGZQFLLOYivjb/KLpvKKCGBPGvTkJhfnvqOdUPm6WoSdo7Ysc/+jkw07rCs9bxSMOa+gqkvAVZ3xB@lists.infradead.org
X-Gm-Message-State: APuU4Z8a3PcYdYMYxKhcdbAwyYhf5Vm+TayjDcxtN4FmQcb/xJq1nKD5
	JlP61aINvn4RtTmo44fe6jNLBcsY8vWFI/rkt/WdTanrOoV/GonH6zgofGJ9JMEfWQMnQF99dMj
	6T9DhKO62fC894nCLhqSfWzYxmTURV9Zlr3nahmmMqA==
X-Gm-Gg: AYBFou11GoXwPdXAs4ZUrn4hU8cMV/d/1cqgJ1iWlsijgHDGRZcCfj8L/gdVEpsl2tj
	ucrsV66UaQ35XarJ+hu8w0QEbuvnTmpih/F6AszLoR0Vl5MfNS0wAXOwWYB2gj/l3cvvb2NYjkN
	tEI0jJUYsOTEPIqwB9a01lYutao5xmi3fIgs6Nbcra4UCjki0DUQMzUQ7bW41uejbsEqoDkQk6u
	KsMEwHOQKLlDI4g6SimKTbOj+ETN8kGuZr+GX6WcFXKLxoyyDbeycdy4G6YU/vgzSuECAMfU7Jb
	dQf4LYkCkZhgCbZlqSTGQcqC1sYICkH6yz9QNByhuLwCp3mObZX36H9n6h2LmsScIHdIdjT1adz
	aWxAK2QBoRt2o9JOsxjtD4ILiSHsP89MGRAb4u2CmX/v1dlC1/JYtaq+UUoPPuAqju1Hayw==
X-Received: by 2002:a17:906:c154:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c50962edf20mr170802566b.12.1794569165639; Fri, 13 Nov 2026
 03:26:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:25:54 +0000
X-Gm-Features: AclHuK-RupDt9op7f4Ges1DbDNx958GvAIMpdcpygcG5RXJOoAuuhRLl1DXJwcA
Message-ID: <CADrjBPqfJTRpsgJza23dup5sB9OxhS+AJ_vzmNtmuuJXQaxOxw@mail.gmail.com>
Subject: Re: [PATCH v3 03/14 RESEND] dt-bindings: clock: exynos8855: add peris
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_032607_678188_92011618 
X-CRM114-Status: UNSURE (   7.11  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_PERIS
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

