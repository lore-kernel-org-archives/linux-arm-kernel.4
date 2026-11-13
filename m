Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48E606A8A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c0AKoHvh;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C3z0Cd1v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1onknRTcb3fwBFQdXWEqphYJTPnuK96XjIBjd9ShqHE=; b=c0AKoHvhXFkQW9
	IVWJJHKoCZYGl8EZ7nP89JpcaHcEXs0xozNCTA9DnzoiUpeQiusYt2RDgd1iqJL/LiWMSI0k2a1Ad
	9tuoADDSQ3uciOkw5FKIyGyIkhgtzNrv55cIRfuUA8Nnq1UheSKdovWUBrH/X/Shai+CSoqy/8b/a
	hC40EXqcF1WFz6E2WafwgLKhhLkL2IjmGacOSS6jse/hP3EL+XRUJ2VkEcUiOueYxZL6bqmPnszXG
	3mA/dzfo46T0YNgD5PPIkoz9fStr9RZuKvw+gt4dWtb75XAlMxQFyuSIoOCXJpX4Jw7fMTsiDATCi
	lJeLqWRtsDeIP7coCgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0oL-0000000EoIU-2dhQ;
	Fri, 13 Nov 2026 23:36:01 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0oJ-0000000EoGl-2bBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 23:36:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58CCE10E507;
	Sat, 14 Nov 2026 00:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794612953; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1onknRTcb3fwBFQdXWEqphYJTPnuK96XjIBjd9ShqHE=;
	b=C3z0Cd1vAfIygPbS/8heuYyhSvJlYLo3H9yWuEO0OC0fmiqOVwY5pQ61zmYOkj/RWeNxts
	cMwouyCr2q7mh53mt9fTKGdmRHNF3IANt94j/pEsOjB/wfZ/ht1+SVa29YLuQQsy4Pyv5Z
	Wly8UUoR8vqYg4Ib2ruV1hCx2MccQ0f9mnxyych9m7Oh3syLnoiA4x5LSQBTchPoxaM57B
	rVQg3lAit+Moe4UPZd0baLnyuhTDyfD5mgsoHqzhp8F5IHZml970Xd/ZVeu1hhle1JuFhs
	ul4JdD+hxbXMWThYaSxMCsYVDYaPr2OQnONB44UX7aNsOFCmK8pXqoyOD6xZHQ==
Message-ID: <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
Date: Sat, 14 Nov 2026 00:34:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: Correct white-space style in
 stm32mp2xxx-dhcos
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_153559_841665_BBFDF650 
X-CRM114-Status: UNSURE (   5.62  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 7:54 PM, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>

I hope ST can pick up the various fixes for 7.4 .

