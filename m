Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2823606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lq6YzF07;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cyjCmlEd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LTgzw7Qx4yJlL2BwvJu8LETB7gbbjhmnMAMVPEMPtDQ=; b=lq6YzF07etJ5HA
	dpiPH8yZ5bhEJ3M/95P3dI0/VWomWghzLSWfsbG+3/9xDC5hyzNGIVRjrLTJOO6reUhyFn+zexzE1
	DawzRtY5LQC9Qo35JFR/+Vq2iWzqM7Fh04/0BJ8WLbQSKswJmbt5P/YUyWdeqmRbt9zrN3zV44zC3
	ELPp3DmlsMG6EM54heMLu/p9YjzBCtdriCgTf40eSLzOHUEO8zSFls7lxeM65B/0xCNyiu3AnV/1A
	Ea7U+iVU6maoDpLtD49KyH2P+P0emM8cphmTwcOUaxWbR8A10eHgZwFnHkE1FLadeCzqJYa1aarjP
	LUh+QeOMmZsNO+f0USjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR7i-00000007Asn-32HB;
	Tue, 17 Nov 2026 21:53:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR7f-00000007Arx-01C1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:53:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so2319825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794952429; x=1795557229; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTgzw7Qx4yJlL2BwvJu8LETB7gbbjhmnMAMVPEMPtDQ=;
        b=cyjCmlEdrreLRMltM+jRivH0WPtxZKco1nrNG7n5xwO++St7AsSoLOGpMdtXL3d0Jh
         BkRZW/Nooof6kgXFP1ca9KK2/vZh4cO9ZN07Xeo8XTZnZlUOsw/ej3RfzGs+Omn5f+5h
         7ZuYwUVG97JLPB9faVs7G4oqChG+74pgUJcjTjByaqsomhL22xz74lEvXQTy2kn6TNP5
         yQw1IQYs64IEgnJc5GRQnOUizK1rCfSs5HI9F/6uyaZGhqgyFFierXgGfNm3dEd8Pl1M
         F/3z+NGeamjL8j3k+B6rSmb6xfCtMwHNFKIvQRgQuJn7Gz29bQBt+sFpByCSlnxvci6F
         jE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952429; x=1795557229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTgzw7Qx4yJlL2BwvJu8LETB7gbbjhmnMAMVPEMPtDQ=;
        b=avPay9a9sMZKb5nZZIBrfCOPjHEovTgoF/maOy9nSOoi2vfpQyYiqL0kbP+8zBsBKB
         YKVBaDaMp66dZDXN6zLMsinafoOHDx7TxPNG0AdOh03LSaNWMyzF3idBy95RctJfxhA3
         0r2LwzcqH7MJscmQtXXmIQgRVlJNW5SoBoMhPZr/hFSPjfA/x3mOAS4f8Sxom3gCaPHd
         0SGgsKFULUr72SNZJEziomUFLzmeDp4o/AndOWYYluXrYogbEhdmy7Lh1XVU3IukAD5H
         +2jmKSd+ttke72C81lmr3ZNbMOJRgRiJitO+xFRR+Mq3/55gVfg4FjnLmRQtjU2O5C0T
         MPUQ==
X-Forwarded-Encrypted: i=1; AL+hErF6QQvnCSPfOycipknXJ+xZ6QuEMEcV/yae+uanif19vF+bbVzrfyVTMC4nk737rorfz4I5V0GFI6dDYqlAApdl@lists.infradead.org
X-Gm-Message-State: APuU4Z8rdNcfsEwtjCffG+Y8fuo0Munikh+Sa10d6GhaC7+8cBnUrTgd
	jbd+iovfj21JZBUbj0oj214KWtpViDOVf6gsGIpn5MyxtRlV30vj5L/w+rIzUGPwVhE=
X-Gm-Gg: AYBFou3Iq6PnPeUyK0B44msOkRjAxbZhEZ2d0fQHRi3Sf9+3NXR68wjDQS6o7tmEZKP
	YVdixxwMSRF0b1FIeQ2k1//bAWK2TLn9MYD+yPBmmVID9u5hBD5FJMGtxd8I0amBVelURTIXk+q
	kWOvqFyFSmu62gZPOEydSkhbfILKkmOSQGs4J+T7RSWgGmHBKJpWJ7Pprej8+8Dlg17R6Pf2vcR
	K4a6wBN/O0QvWF1J+4saxzHq66kwHe75LuwYzYD79DWYrfiEhsHlByYLLm4xQBHw1C6lo+byfbZ
	jDv1oD0bAgGO7J4V2Pro4MqbQOT/Kl2JDug2wPiu97Kff7SGJi12mThP1wnw3C6WXFVi9Arwed2
	7e9sZl8iWyI7xV3cndJUvjPB0knpINoMe8DIx+RnlYHhNW2yHqEvxd4QJyewl6P/XJtG5aYzMrA
	4JPygdXx9idqqO49bGl4Z8Ye7tQLPPHQtF/4XY1jc+X6cWkO3hGYTc4IQ8R3DGy9i8zrM1dlrcn
	MRxK0ylJEY7wSdMn1dkNSSBrfUpQPjKuegXmO9vtC0rocgeq9fNee51ZJ98b4A2u7UF8CQO1NFN
	n6nktx287LFcIeHw6OV5FL9Jg5Qv7rSqJxG1W2pKbev8aZzjmCG+vNc2gmvpbm8urq6zCJSv4PU
	T5g==
X-Received: by 2002:a05:600c:6995:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4bb7da03a42mr9384865e9.5.1794952429178;
        Tue, 17 Nov 2026 13:53:49 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm136099085e9.4.2026.11.17.13.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:53:48 -0800 (PST)
Message-ID: <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
Date: Tue, 17 Nov 2026 21:53:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in
 rocket_job_handle_irq
To: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-4-kernel@airkyi.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <20260814022453.437-4-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_135351_085007_0796FD0B 
X-CRM114-Status: GOOD (  10.29  )
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

On 14/08/2026 03:24, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The rocket attaches the IOMMU group in rocket_job_run() and detaches it
> in rocket_job_handle_irq(). Calling  iommu_group_get() in
> rocket_job_handle_irq() causes the reference count to increase
> unexpectedly. And this causes rocket_core_fini() to fail to release the
> IOMMU group, leading to a resource leak.


While there is a leak here, I think sashiko correct in saying this 
change would introduce a crash because core->iommu_group can be set to 
NULL before this codepath is reached.  That might be a simple fix.

> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")


Wrong commit mentioned here.


