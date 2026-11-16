Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A8A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TLMnh8Kg;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EIFt9Gpf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WGpPHlp27eLd/3ufag714pG7Ob6mcgDNBDzjIoQkmzQ=; b=TLMnh8KgGyWdpq
	5EGHGUp3p15zPTp9tM9BEbygl/ynkz3FNZ3YCKXUqQonVjhTsrzVWRmYsFH9lj4/ri7fpTGFs1aj8
	i8ylIuvCQOmvB/w1eIUP4ojR1hC56TbG+xu7uDKa+YJhyxyDHNNiy2OTZcoXTLcgrDd8dNkl1vadW
	idO/UbZTM1dhyCcl7GSOjE+zLEHl5rLcyqoSQPSJjmex4bhy2mXdcJfKXaXsUBNR40FGmrllE5hpF
	IGVcSKA/CQypDlgw7DrPXPkGPoBhIs/syoS5DjyvvRJOCJaJ+CWmv7nF80y+NbA93V6iFiuO8Escf
	QohVVA0mJMRewnEVBipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStXW-00000001spf-0Xlo;
	Mon, 16 Nov 2026 10:02:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStXQ-00000001smF-3Qfs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:02:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 977D71476;
	Mon, 16 Nov 2026 02:02:03 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A29F33F763;
	Mon, 16 Nov 2026 02:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794823326; bh=m1pqCFaB8pT8U8oUefOEomkAT9cqlsOwSe4onfrndRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EIFt9Gpfs53zTwlfVkrDEfC0LKqO+DyjKBB0LclR9WTs9sVWyyMdqyNIVje1PFvGI
	 3sPc1hickFyhYZvHyNwWiKXxn4Md8HW0OZR5WJmUcCI9uyaMPpfj219LjMXvCJK2nm
	 RB7EPRtNILGHZ4GZTuXkPYw6nCS6cHgrerZAbvnM=
Message-ID: <1489791e-b205-44fb-ac77-f2525b20fafb@arm.com>
Date: Mon, 16 Nov 2026 10:02:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com,
 maz@kernel.org
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <c5b915dd-8926-4c97-836c-2616bb314262@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <c5b915dd-8926-4c97-836c-2616bb314262@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020212_984097_46FF89D6 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

On 11/16/26 06:58, Jinjie Ruan wrote:
> Hi, Vladimir,
> 
> While testing this patch set, I discovered IPI as NMI now defaults to
> using SDEI, and the FEAT_NMI cannot cover this path..
> 

Can you please expand on that? Sashiko has several comments related to
interaction with SDEI which I'm planing to dig into. However, glancing
over smp_send_stop() IPI as NMI is kind of try and see approach:

  try normal IPI
  if CPU is still online
    try NMI IPI
  if CPU is still online
   try SDEI NMI
  if CPU is still online
   give up

So, if NMI IPI did not trigger in your test, I'm really keen on details.

Thanks
Vladimir


