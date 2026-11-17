Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADFA606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oopa/M/A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QpOjC7y4;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QohGgGDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jHmFKQcEpErH6yTd+BcsBpSAeqJz4+fdKXvQPpS1SzY=; b=oopa/M/AHSa8xw
	fB4OSuX/eebez3gEXQOZQ5m3t0R0wX+4n65zWGf78sWmStqTCtDq7uJ3MpmRVTXfpv0x/VH3yR98I
	l/sv2LU/tYQJAM0PoOnVfpyCLrg1Il2htPXzMpBpadJn5FZzj6dfkZcU5+JjhRqpHUlXfpVCUrupF
	Yp4iN7inNaVI+NwjM9IQM3GugTI4JH2cUc1WP2rpxOin2Gzv4EbsNlQwVFkuB42MZNy93RmXZodlE
	HpD7Yx6btsiKERDZ4Zbfx+6NMQ77vNZdYLfehauWl0IDewfmx7SjF4j4Ns00kOB4SDcitLDFoPSm3
	CbnUDNdsCCUdn5krwlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFFd-000000052hM-42Oy;
	Tue, 17 Nov 2026 09:13:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFFc-000000052hE-3LqT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Nov 2026 09:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jHmFKQcEpErH6yTd+BcsBpSAeqJz4+fdKXvQPpS1SzY=; b=QpOjC7y4MtmESdUVJBhTuACDga
	2sA6o3zHS7bW1bh8OJ673Ykoe9keJggRybyRPAx/89ZgCrUldtwBTnX5ijcwSs0wGSIMzMwKBxCas
	NqbFRpMhTnD7iFx8t1XZJ9rY7hnj6x+3aWFsvIyq1qJp+a9CaIk814JH4zYk6UAzwycVUYst8mPUP
	6jYD95as8Q4NJoYHpZsVV9ScDuj+HSml7z71sHLlahx1YrLnKSoYVFk0CZTnheTVLtLSxuheHZjL9
	dGVcWCN9eRTWu2QebNk0HljsqloVU9zhTcUST0CFXokgpT8CaehS6i4vu6S93SsyaawRdYq5qD7b5
	5WB48eoQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFFR-0000000EiCx-1ttr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:13:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E715A1A151F;
	Tue, 17 Nov 2026 09:13:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B28265FC81;
	Tue, 17 Nov 2026 09:13:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D7C611BC0493;
	Tue, 17 Nov 2026 10:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794906781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jHmFKQcEpErH6yTd+BcsBpSAeqJz4+fdKXvQPpS1SzY=;
	b=QohGgGDTtw8azbIR//VvfGrlr4V+zs72XDzrDyoJRb0V8W2WTIhMsS3Om45in7H2LQEW79
	y5ssLoKHMOcRF/+IV5057ZnzwjPoUzMav9cVjrADQiDTi/ngtIi9W0tDHEewPhs5aHjR6w
	e54Y8nkGdm8O0wjLBZUwxszXdEB+Ki+9uTLld22EhInWUrVgQGF8K5kfgDzvE/t+azc1oQ
	XEvKOOiOer6Uvhtd+3T59zk6YyyeWOZ7RbGJlmmIAix6Xe7iS2HWD+uXi4/dM9a3KjopYJ
	8gb8TbQdW9aL++PfMCZtctJXUqPtztwaNOaUWyr6BdJvb/ff8yfekox+qYfnLA==
Message-ID: <a0b1ea81-97bf-4a16-895f-5b6820a46c61@bootlin.com>
Date: Tue, 17 Nov 2026 10:12:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: re-enable on-chip parity checkers for
 XGMAC ASP 0x2
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 horms@kernel.org, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261114015554.2187341-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261114015554.2187341-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_091305_535700_C50A0ABF 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -0.2 (/)
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

Hi,

On 11/14/26 02:55, Zxyan Zhu wrote:
> Commit 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC
> Core 3.20") made dwxgmac3_safety_feat_config() bail out early for
> asp == 0x2, assuming that configuration has no parity protection.
> 
> Per the DWC_xgmac databook, the ASP field of MAC_HW_Feature3 selects:
> 
>   0x1 (AS_EPPE):  all automotive safety features, with ECC and parity
>                   ports on the external application interface
>   0x2 (AS_NEPPE): all automotive safety features, without ECC or
>                   parity ports on the external application interface
>   0x3 (AS_PPE):   all automotive safety features, with parity ports
>                   on the external application interface
> 
> The reset value of the field is defined as:
> 
>   (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 1) ? "3"
>   : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 0) ? "2"
>   : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 2) ? "1" : "0"
> 
> so ASP 0x2 implies DWCXG_ASP_ALL = 1, where the internal FSM state
> parity and timeout (MAC_FSM_Control) and the on-chip data-path parity
> (MTL_DPP_CONTROL) features exist; only the ports on the external
> application interface are absent.  The early return therefore skips
> enabling safety checkers that are present in the hardware.
> 
> Drop 0x2 from the condition so the FSM and data-path parity checkers
> are enabled again.
> 
> Also update the safety feature descriptions printed by
> stmmac_dma_cap_show() to spell out that ASP 0x1/0x2/0x3 differ only
> in the ECC or parity ports on the external application interface; the
> previous wording, "All Safety Features without ECC or Parity",
> suggests the on-chip checkers are absent from an ASP 0x2 device.
> 
> Keep the early return for ASP 0x4 (EASP), which selects only ECC
> protection for external memory and has no on-chip parity features.
> 
> Tested on XGMAC 3.10 and 3.40 cores.
> 
> Fixes: 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC Core 3.20")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

Seems correct to me, couldn't test it but this matches the datasheets
I have.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


