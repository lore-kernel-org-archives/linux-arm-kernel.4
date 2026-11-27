Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DEB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3HrNnNX0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7LbIq7QtBuD8l1ZM3ysDGC4GsDSWb7XrF/nM20+iPNU=; b=3HrNnNX0/3H7k7
	7x6z2zWtLjHTdiHEj7q0pOUWL2tIt7xrohi+BOaJOU+GK1+jMAcwm5HSUywaj7WdWKt1HjbWywBiE
	YnACjVRCoxDxbt4o2AAuFXsUL/fGTW+U//wagOMuWrlgByi3bcun3DnYKY6GsMPsTs7rkG02GH+ss
	+h6u6vyOpC26RUz6BtpqeT4a0XYLLtVYI2vYCLdcc1w9vYwpLeKo0nLZvVK3D6uDZAVqhpV66dIxx
	OwrqowjR5zisRUK2ca6oZ4eoAgvvxWAjiDTaqmYhRM5hhdGq8wyY+QnwgNLs33MXRjkZFeLgVYGeF
	LPd067LtHecgj9oIcPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2lB-000000004Y6-0HHS;
	Fri, 27 Nov 2026 20:41:33 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2l8-000000004Xo-3KUI;
	Fri, 27 Nov 2026 20:41:30 +0000
Message-ID: <17a9f3e0-f075-42de-b173-ae334b51d0bd@infradead.org>
Date: Fri, 27 Nov 2026 12:41:29 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/10] Documentation: coresight: cpu-debug: Fix the
 module parameter name
To: iav@iav.lv, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>,
 Feng Tang <feng.tang@linux.alibaba.com>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
 <20261127-b4-coresight-cpu-debug-lockup-v1-1-69d3ad1e0fc8@iav.lv>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-1-69d3ad1e0fc8@iav.lv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/26/26 10:38 PM, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The parameter that enables the debugging is "enable"; the module has no
> "debug" parameter.
> 
> Fixes: 0cd555c35131 ("doc: Add documentation for Coresight CPU debug")
> Signed-off-by: Igor Velkov <iav@iav.lv>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  Documentation/trace/coresight/coresight-cpu-debug.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
> index 836b35532667..32fbae244524 100644
> --- a/Documentation/trace/coresight/coresight-cpu-debug.rst
> +++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
> @@ -130,7 +130,7 @@ If you want to enable debugging functionality at boot time, you can add
>  The driver also can work as module, so can enable the debugging when insmod
>  module::
>  
> -  # insmod coresight_cpu_debug.ko debug=1
> +  # insmod coresight_cpu_debug.ko enable=1
>  
>  When boot time or insmod module you have not enabled the debugging, the driver
>  uses the debugfs file system to provide a knob to dynamically enable or disable
> 

-- 
~Randy

