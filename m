Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xE/TM5F1;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g81XMqwr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OWE29uFtdXjnPVSYrt1Bh9uULEOob+YcjPT4yEGlz2I=; b=xE/TM5F10NnrQ/
	yeThWvZlA6I9wa8W3sd8q1m8/syWYZBqLtayXQ1WXX8YtaCv9r8chQMdO+OFXXmALWGdS4CMnTm9/
	aETCSyE6UERPtksMVOe909566wNzaveuZq4mwJPyLnzANezdMN+VWOvd2at5ZjXkUTMmiaJtXqsR7
	4wFA9BIB5asI9VwuZEh5iF40sh2gl+3Qau7N46kToxUGZafxE+pjVev7zLuKaDSwQ5nhEwhdauMK5
	ZcpDEZipVkOoFMEMMXoi3N3/d7yQHHtBzfqRmpsPfZRt1vedfibYTPWr0ISAY38/BURc/tnOSq0zg
	76ifNFYAzMoVSt8oFvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxkR-0000000Gk4c-2n1B;
	Fri, 27 Nov 2026 15:20:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxkO-0000000Gk3n-0CQp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:20:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6EC9169E;
	Fri, 27 Nov 2026 07:20:19 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91D883F632;
	Fri, 27 Nov 2026 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792822; bh=ZlKtMOJ/8yeG2xhi4j9uF/kBsbs+sWEiMz6tTAhsT1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g81XMqwrKio2yZfop3Ht1FXPVQTLBHirA5+NO9yNBCbebB1/h1krLrSNE1DRXYO4k
	 eJ1j4Gc0Er1NEXjGs6zCmHcg2EAQYeWQzDIdxQF2iJcX5b9OBIvNijtfbLL1WXXR+K
	 zN8hCfWlbPJ0CzBix3BPU7vfHNB2A4ly+aLNbPPo=
Message-ID: <e69b3f22-f9a9-4cf7-83b6-95dcc8799c6a@arm.com>
Date: Fri, 27 Nov 2026 15:20:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/23] coresight: trbe: Decode TRBSR status codes
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072024_131964_CF3939A1 
X-CRM114-Status: UNSURE (   9.63  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 17:55, Leo Yan wrote:
> trbe_get_fault_act() currently handles only a small set of TRBE stop
> reasons: external aborts, trigger events and stage 1 and 2 aborts. Other
> TRBSR_EL1 EC/BSC values are reported as spurious events, which hides
> useful failure information and makes the status handling hard to extend.
> 
> Decode the EC and BSC fields explicitly. Keep the normal fill-mode
> handling unchanged, but treat unsupported or unexpected status values as
> fatal and report them with a ratelimited diagnostic containing TRBSR_EL1,
> TRBPTR_EL1 and TRBLIMITR_EL1. Use %p for the buffer pointers so the
> printk diagnostic hashes their address values by default.
> 
> Stop using is_trbe_trg(), instead, use TRBSR_EL1_BSC_TRIGGER_EVENT as
> the unsupported trigger case. This keeps the stop-reason handling in the
> EC/BSC decode path, the driver can validate the status fields safely.
> 
> Move the TRBSR_EL1 BSC definitions to the arm64 sysreg header, and use
> the common TRBSR_EL1 EC/BSC names in the TRBE driver.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



