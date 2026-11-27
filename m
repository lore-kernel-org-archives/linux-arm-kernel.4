Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iMR91zS+;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aQBJ8MHJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=exyqA4xjQHJ8t9SqDedkQRc8moWZMY9lB2uphlyg/ec=; b=iMR91zS+O2dN8C
	TiwmKHiUpS8rKfTpxHE3Wpzn2Ap1t3jWG97h9IixDd+EgycXOhZXLyN1WvD9S5hK6FZqZY/J9RxLu
	+a34r79wN8YHUL18LnvKITMrCGUTXQOcxBsqSmQdu33hLng5q3jR9pNnMtMmGMtkW2iRs01DSXBSg
	hQuUhkLMf85L7jKKo/4L8iDtlkkEcEXHajU+1zzBtdr/CT7HXT2v8s5FIOEh5UePyd2gkHq3O9gxS
	DUJ90wj3GtQbfb1GbKnRhE0H+nhqZl0F7ztkQl6G1JrjFMIsGeCzrvlro+AOtBK4ytdBJPDOMT8AO
	V3OweFd8ngau+n6wtslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdF-0000000FA1w-0W4Y;
	Fri, 27 Nov 2026 07:44:33 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdB-0000000FA0n-2n5Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:44:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=exyqA4xjQHJ8t9SqDedkQRc8moWZMY9lB2uphlyg/ec=;
	b=aQBJ8MHJprkEys9KsARq71TnWg1b+SkJLCo+KannvjVX0ckEamBuo0cnCDhf8rakTUP93K+x7
	1M3LaVSMu4s4dLJiVq0OS1WwxiGa9N8mSv+EE5tXETySWF6ZB06WaiWjJ42vzaEje+p+N8VXOPk
	dgz5qNat3d6MPTFfSSQ21c0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jbQPq32HQzcb49;
	Fri, 27 Nov 2026 15:43:11 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 6766740575;
	Fri, 27 Nov 2026 15:44:20 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 27 Nov 2026 15:44:19 +0800
Message-ID: <6B0934D3.3020302@hisilicon.com>
Date: Fri, 27 Nov 2026 15:44:19 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong.xu@linux.dev>
CC: <mfd@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH 00/12] arm64: dts: hisilicon: DT warning fixes
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200006.china.huawei.com (7.202.194.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234430_270846_13C69512 
X-CRM114-Status: UNSURE (   5.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -3.0 (---)
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rob,

On 2026/11/12 3:40, Rob Herring (Arm) wrote:
> Another batch of DT schema warning fixes for HiSilicon platforms. This 
> fixes most of the remaining warnings on HiSilicon platforms.
> 
> It's best if the whole series is taken together.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks!
Series applied except the patch 02.
Maybe I will send the PR in the next cycle since the patch 03 depends on patch 02.

Best Regards,
Wei

