Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PlG6Qpkc;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=S9MI7p8F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b8/Om5r4OOqZRSoAI27MxRWrMg2+0ul1nFv2YlNR7Tw=; b=PlG6Qpkc/+bBPd
	GFYtK8HC7bAdBpZQNKQOSx5nbZu8/npF/YGsq7bmZqVdXGIxKGvotsGyWxL4XL+ZOYZkPArLGo7Va
	f3YdTCXtsPhQF+zfEyTnJA6GuIzJI87jDhaxf6WNCkfLM13hhknVCD9P2FWfddJNFowzRtNot8FsE
	xZgY9b7gDy7nVdx9WDMez1xHU4dMEJP6Gt7+7K7bqsg6SMH5ZmijKCt2E7fYJkgsY1nTHQesU6HH4
	nwt58AruUE1nhxOvttmWlUhRCux84ZD22H8JyOxwuLeHahXpApaDuLatLPoMBpPk/ijnLa3ZLOHeE
	OZI+PbWdAFs4g8H5EePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHvU-00000005WdQ-0Gj8;
	Tue, 17 Nov 2026 12:04:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHni-00000005VuZ-0ODG;
	Tue, 17 Nov 2026 11:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794916595;
	bh=AcKOBruChaR8ypBOJHDWNFYx4dckNjh02lWHi41qQSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S9MI7p8FNmcFSIt/obHNujnaCgPiQU1FpLQOE0WLyJw2ZINt1pV6WLw39NLPg/piC
	 96yfx1Pkhk+Yzwna3+7aso9t5WF36zlRw6QPwZJlE3rwKkMreeOlNEGAO1E5UHQct5
	 HQ4LXYhoWupon7McApOjOBvEj/1V5UiRZPJu/qHXLTABpFjUtNTKVvdgQaWMivgcNd
	 kS2S+X7jU0S3f7E63c1HBUoJWsGysQFYN+4TV1mZlZK0H09FsQDlDuzruggtWvijxp
	 2CugvP/KfgmjbhS2Kv1/xqzN9YzWyTTiXhqD0vzPVPNQgUakxMeG9DCutyOSaVAAUN
	 Rnf29AE4qkIPQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 372F417E05D6;
	Tue, 17 Nov 2026 12:56:35 +0100 (CET)
Message-ID: <33bd4c10-ccf6-4cff-9aaa-5c58e02ee1bd@collabora.com>
Date: Tue, 17 Nov 2026 12:56:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 4/4] nvmem: mtk-efuse: add mt6572 support
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
 <20261117-6572-nvmem-v5-4-9b561a8a83e1@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-6572-nvmem-v5-4-9b561a8a83e1@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_035642_044882_054747BE 
X-CRM114-Status: UNSURE (   6.59  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a platform data struct for the efuse controller.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


