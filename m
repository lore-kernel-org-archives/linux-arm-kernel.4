Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C67606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GC7mPBlQ;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LTJHUSrg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=km9GD978uRX5/nYQ4zVMWd8Czd4GQb3wZwOd+NOixeM=; b=GC7mPBlQwsDzr3
	0rUauDuRhgKe8D/0wigUKvNNLG6ytXUZaZBhX1D54xUQ7i95k5J0AMSXXe+gUbECJuq7rinE/otP9
	hmp1Auh/LC+qg5Us95QxeNrZgn/2BkaA+VOzmlCzuD3a/sxFigFtt9GT6rmTbma0T7QGiU9gUq1Ze
	LH1mAdeIkm6eA+9BMGTbUCQpZEbWgp7cu/B1j0FLcSLfAFtLsGrfsicdEW0ylgtl3pDPxKk+AVy62
	gKB+gsmiMJNgXvymgaaM99vTcy5vNhvqbxLk7UJzpwyik3f07sVfCdC5NKUf2YHt/UngUuaTvXsmm
	YuggsfXmQh1l7b/5zQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTizC-00000009eGG-0yTX;
	Wed, 18 Nov 2026 16:58:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiz9-00000009eFB-3B73
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:58:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so12823985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795021093; x=1795625893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=km9GD978uRX5/nYQ4zVMWd8Czd4GQb3wZwOd+NOixeM=;
        b=LTJHUSrgRy+M5BFPBDspHRhGQnLgOcNn1R071xQV3B5038sbj0aRBpGJ8Dxd+9knqt
         ZMv7ZafLpm5RNJQrNUd1zDzKTaOq9xQWPIMwWQSjQj41HEt67Ff+Us6zzs5Ue11opNn6
         n8sPiQ7GaHokD+qgmpQkck6p1E7MvqEvZsecced/RB5sptiK3a03Zax3IDPpeN4Qtzpc
         9ZH1VMvSVs+mZFrecxBkfAFT3LpJaNqGI55zJDyiEFHItg4M+ZiE+LA1LGUWsavo8G2u
         jdAMUVbTSl9Q267Ds6w1oYTmnC/5POyWrd8nPACc2JVrUWol5Hc6yTLlk3xTLrbCKkuY
         hIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021093; x=1795625893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km9GD978uRX5/nYQ4zVMWd8Czd4GQb3wZwOd+NOixeM=;
        b=eq4byF/EguMj16J+D5JxoUaf6u0Hrl4WNZ94vwATMSvK2zTG2FjJtWDsNcG6v0wsrD
         hPbX7B+RSz4/2Uf4+PfFZo3ThgMvzOJR5UDltqpVOLzefHhrar8aPMgI+cdXUv9MqyoY
         4BrueJlAFPk5LOho2zhbo+Gqm3k6+OwfHXT0Cb9fI4zRiBrITMe2z8tv9LoDeWuzlGd2
         XLFhuQ/EBuzhXH/Xlp46MVsJ2IKR11VkAwDjDluCUjxt4II+bs/hRg3xemC92kzV0z0e
         K0NK6trGIY2ceqxD0MhS1DlFHTAIf70VVvw2DnKNl6h26DXG+aGU0MgOOX8dTYQjhAQe
         ydPg==
X-Forwarded-Encrypted: i=1; AL+hErHYbZPgtJLpmfNKHkvp12B/l+P/twmlCSv3gqE1tILwmIsA8/8FO0Y/z0lURlYZHQ55POQ7GW4BR2JdcZk7HutL@lists.infradead.org
X-Gm-Message-State: APuU4Z8pjU2FBdc8ro2K4SZ42uuNjag5Yheg6RQGbxhSUnGYwSsR1bac
	Lx0TuKw3ZIgN+/cJM9B0/GcALIfBRKu4tuRFjAULgH06fIFyql5zjLXXnVXYf05SQP8=
X-Gm-Gg: AYBFou31XgQLyAXFkRjFWaDDilSFmAySpolJ1M3VYctYuSoXiIsRIVzd6Vob4qf0dna
	zJPW8LxCRZfz5Ao/srUTC35Sq1l0QoYWfEZTrAkdWxwD+m91TC4okty2WIXqDlX4KzPPPBtOw6H
	z53R6wBrzZLiKDQ2VT4ZCeOSFhPPMyaet2LzqtpRjgYjYE5zyD+eoiknqY9xssH1R8bg6AqBpl3
	DS/cNstLx0uHnGy3gW42GVVLX2s0ySaviN08sSU7fbdao4S0tEhq1PN6qj8T/iPLXy2ddEWLP9R
	t5xeFSmEa1zFzoDQDSZeh7iQvWVey8QNMppuxHzsFDcfKfxc0KtT0f7qbNIHyiWwDxcBWmCPYl1
	S6IJdbw/6WPWZbyIue1wxBKlvnEHMSfIu7tYSyLzFdiX1tIeRvgx5m+M41yGwEeCsdscy+ziffu
	6o0/ylB4IycXzqEF85Z8+yergLABrINqro2LRKEHLNYlIyB7/MiT/hLNzSJpOkBDqL+U7TaFV0X
	h1btn/Ggc42cseNx22t90oOSdCc07+vkhxKgqC6cYL7PZZSDc/LP4Ct10moGJvwCz9YiET8/Z+M
	upBR2G/g4im2KzAAQNdbl0FkwJxrgf8cAg==
X-Received: by 2002:a05:600c:4fc6:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb7da26333mr64023955e9.18.1795021093075;
        Wed, 18 Nov 2026 08:58:13 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8327c2e8sm1881025e9.3.2026.11.18.08.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:58:12 -0800 (PST)
Message-ID: <43e1d316-bed5-4ec0-8287-44663b359e11@linaro.org>
Date: Wed, 18 Nov 2026 16:58:11 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
 <20261112171043.GK9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261112171043.GK9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085815_958929_FD2E70D7 
X-CRM114-Status: GOOD (  13.18  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 12/11/2026 17:10, Leo Yan wrote:
> On Fri, Oct 16, 2026 at 11:46:11AM +0100, James Clark wrote:
> 
>> +static enum cscfg_load_ops cscfg_get_state(void)
>> +{
>> +	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
>> +}
> 
> Could we check !cscfg_mgr explicitly in the three functions instead?
> 

Didn't I do that in the original version and you said to add a helper? 
Maybe I misunderstood your comment?

> Using CSCFG_UNLOAD to represent both "not initialized" and
> "cfg unloading" is a bit confusing.

Is that not just a naming issue now? It could be CSCFG_BUSY or something?

Problem is one of the users looks for == CSCFG_UNLOAD and another looks 
for != CSCFG_NONE so I don't think adding a third value is straightforward.

> 
> Thanks,
> Leo


