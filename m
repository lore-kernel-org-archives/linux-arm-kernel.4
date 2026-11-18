Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDE606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GKVeNsD;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QupW6SWA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jqZDsw4/Pv9G6TuHSSZvax905ZGFTyfcu7eywgbZg64=; b=1GKVeNsDCb6DB4
	R1PVZy98XHAzVQJ1dcTEZy6A0sZG5GR+7s58VBceNUBEy/3//kXF7uVLTzIt9d7KcENQ8cdBnL5q6
	6U5ukJIyirpS6tctdViWHLYhVxYbt29eKwhnwmVWvCLc3P87NhDyK9nV2oILrnaDaDcJ8cJprCEcY
	AxAT+3l9sGpCiexL/OdPc7hC+vk1YUoHsqRFHeXI+1st2kNwZ9YJIzcQtpqyTTRFmKYXAyf7dt0CQ
	o4OHKYyvE79q4Znem7DVbOCvyv3D42efSvb9Z95F4DWU8g8sPCy2QIOIBKq9cIADM3nYFHGru4Fx4
	hUCEYi3fgJZAyEIGkKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfNg-00000008uxX-0Oyk;
	Wed, 18 Nov 2026 13:07:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfNc-00000008uvR-1lht
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:07:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB2A21596;
	Wed, 18 Nov 2026 05:07:08 -0800 (PST)
Received: from [10.57.92.80] (unknown [10.57.92.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96E0D3F673;
	Wed, 18 Nov 2026 05:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795007231; bh=HEpShK6JaeOW8psRd/l3RPEF82DAOAZP4AgLiMMwhBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QupW6SWAiFEoX/bwQ9NysNdamPSKgk89MHHXCd0ACOkYEIz954lHFV8MRL+DE8cVG
	 YvCIPkg66Qttzfq0/Yl5ggwKsbTyrwVYlkPbhyQ4vl5CspuegAHlQidKIHDBtY6SOC
	 9bEqTQJAqeft2gn5jMI19CDKxiclG9Aly36P/81I=
Message-ID: <08d06f8c-026c-4503-8783-6b8a1b59d620@arm.com>
Date: Wed, 18 Nov 2026 13:07:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: perf: arm,smmu-v3-pmcg: Allow
 power-domains
To: Amita Mishra <amitamishra@google.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118101913.3135869-1-amitamishra@google.com>
 <20261118101913.3135869-2-amitamishra@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261118101913.3135869-2-amitamishra@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_050716_598929_431AE601 
X-CRM114-Status: GOOD (  15.97  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-18 10:19 am, Amita Mishra wrote:
> On some SoCs, SMMUv3 Performance Monitor Counter Groups (PMCGs) reside
> in switchable power domains rather than an always-on domain.
> 
> Document the optional power-domains property so that runtime power
> management can manage the PMCG power state.

Isn't power-domain-consumer one of the common schemas that's 
automatically applicable to any node anyway? I would think that unless 
we have a specific expectation and description of what each 
power-domains entry should represent - which we cannot reasonably do in 
a binding that is for the architectural PMCG interface rather than any 
specific implementation of such - we'd be better off just leaving it 
implicit.

> Signed-off-by: Amita Mishra <amitamishra@google.com>
> ---
>   Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
> index a4b53a6a1ebf..aea6623bb98c 100644
> --- a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
> +++ b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
> @@ -36,6 +36,9 @@ properties:
>   
>     msi-parent: true
>   
> +  power-domains:
> +    maxItems: 1

Even for existing implementations it would be quite possible for a PMCG 
to be functionally dependent on multiple power domains (yes some of them 
should usually be hierarchical, but still...) - what justifies 1 being 
the only "correct" number?

Thanks,
Robin.

> +
>   required:
>     - compatible
>     - reg


