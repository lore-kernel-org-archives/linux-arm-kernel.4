Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43705606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j5KdOZzH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EXaUOyPu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zSOmY8Gy8e5lYgsKCLO/qRks5rr/DxPaHmfpdFVxrjs=; b=j5KdOZzHEmFtWC
	Ehhd6KZV8cQ515CPLK85NhYZNHOiKxrcyDWPOx2fEb3QqX8ZixIvzrWg81dXG66s/clntTOu/Evy9
	FyLLyryHdyjBwyCvS/2Kcy2+sYMb7pKbfkC0jecZhVFicleMuuYWV6rcZj6cxBc8RnuNr95nQJh7r
	j4hM4kfcRmTY16olmwBROzLIffPn24z/0GRtOFnGEmO9mfpNguDplF7rLxX7JyEH1J+6aRBg5J6L1
	ie3PWf4PlhYa/vfvs0ExP80D3GJs9i+DRTmNewO+P76Q2UF4Z63m3j8b7SBAb14VrVVIvb/KbmkYG
	cbMDgRPGpu64Kk3cNxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDBn-0000000A1KE-222h;
	Wed, 25 Nov 2026 13:37:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDBm-0000000A1Jh-3Dsw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:37:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F15BA61844;
	Wed, 25 Nov 2026 13:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33B61F000C0;
	Wed, 25 Nov 2026 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613853;
	bh=zSOmY8Gy8e5lYgsKCLO/qRks5rr/DxPaHmfpdFVxrjs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EXaUOyPusUq/AJoUUXm//v0oKLMF+1aMfPX8gIS7gjQOUdIpYjk5+KUKcPcnhB3MY
	 6gTmU16p2Pps8Te4FQ0rN89jd3Y3MkOq4YdFFZz5hHZmlXzP8uMp7hQ0QlBv/v5UrF
	 nrZvwC39sJ88YBj/RKOVCfCexdCtKZg3ZIHcrC3lcarozW64BTRhNrST37M2NAdSCf
	 IVRhcW0eluFFy1pXI0TtkZvM7sU1832mrcQTneg8IUOjMmX0A3e3aL2IHjgcpFBdXl
	 Z5ksKSDE04+rz7OBvAm+ukCV8k8VX3736k4q7b+KJIxUTTJpMz5oN6RaGcyvhwgo8l
	 a9nWjJx7FaM6Q==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names
 for ETR and STM bus clocks
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <ecbfc73c-2961-4e05-870c-cffae1d4cf60@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
 <179553246414.44164.14668877546162285849.b4-review@b4>
 <ecbfc73c-2961-4e05-870c-cffae1d4cf60@foss.st.com>
Date: Wed, 25 Nov 2026 14:37:29 +0100
Message-Id: <179561384966.84329.10896464850349756791.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-24 17:17 +0100, Gabriel FERNANDEZ wrote:
> Hi Krzysztof,
> 
> 
> On 11/24/26 16:01, Krzysztof Kozlowski wrote:
> >> The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
> >> CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
> >> described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
> >> ETR is already CK_BUS_ETR, these names are confusing. They also differ
> >> from the reference manual and from the STM32MP21 binding, which uses
> >> CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
> >>
> >> Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
> >> values, and keep the old names as deprecated aliases so that the
> >> existing users are not affected.
> >>
> >> No functional change.
> > That's ABI break, so clearly not true. Users of this ABI - this header -
> > did compile before, now they don't.
> Thanks for the review. Existing users should still compile: the patch keeps
> the three old names as aliases at the end of the header:
> 
> +/* Deprecated identifiers, kept for backward compatibility */
> +#define CK_BUS_STM500        CK_BUS_STM
> +#define CK_SCMI_ETR        CK_SCMI_BUS_ETR
> +#define CK_SCMI_STM500        CK_SCMI_BUS_STM

Did not scroll that far, that's fine.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

