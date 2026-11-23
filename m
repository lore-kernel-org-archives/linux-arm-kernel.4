Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58910606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vo0HD7tw;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qm9wfo9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SUu3oaJ8puWJKKOfHdRr4SqhOI+nPpr8oDOkprv0KLg=; b=vo0HD7twZRlFZmwg0BGDhZnQTx
	KR8jUG6tqiPeDt9jujIiS+Rxt9IlDR8z05o//FQr0J2dMutiDR7xocbFhJ7leLmLLU3vRcX+gGA3N
	60Ly5iErbFavFQno0dIOO24x9AgeMfhLu6hen8VWYXz+sG6nu4HEgOV4bui8EM+1X9LgYlfHAn3LX
	MgszuLQRITDWJOLFQXXwcPavFYRId+cO+Qg2uKqP8iCrwbpK4PXgxuOwPvOxwyhOBBzJzL/qdDKKk
	xo8Isc+ix5xNnAHoM/GbG92upbdL8YNAdt7R5UKGHodFzfd08l564uYZFcgFRp6+Hr7GTmm3IrHCO
	d3C7W2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMyi-00000002LJJ-3RnK;
	Mon, 23 Nov 2026 05:52:37 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMyd-00000002LH9-0HpD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:52:35 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3282db206d3so8838625eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 21:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795413150; x=1796017950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUu3oaJ8puWJKKOfHdRr4SqhOI+nPpr8oDOkprv0KLg=;
        b=qm9wfo9D9h3zJISqVqFsJhwYz5X7ylvAuJxDJTyaqi4KX12EX3+NzqVASa3lA+Au8k
         MOKD63/JnkBPRFctlwbuDz5nL+t3xmMMiZnGRgVLn+pgcXoepMGpFxtWUeDxDYdYb4Yy
         hf05arK5GdsVDNsl4d+lcizXLeJxtugd5f90OClOrNZoaCbtCCgLy4B2u+RFf/c68qdC
         vDmRTM6kwmqyvP4sTBS9BjfrZ/thXmhgbtL3xX3dJrViBZLju9IdVJZSCNwZOcey1kg1
         OSOgiT+xIxa6xYoF/jZGw9ccuYbN9tXz1/mgYOw70084emSW0DVVcwkvt7oZ3bmqN2J0
         6eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413150; x=1796017950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUu3oaJ8puWJKKOfHdRr4SqhOI+nPpr8oDOkprv0KLg=;
        b=TnYe/M+3M28nqXexW6i4PD7xh1Wgdc9L/b/LhEFeia/jeR9sZf+OBzLdRqUdwFjFzN
         SzMxmnngZrAcNP02ld7QwALuU3oyNbm9aIhADlPnPRJH4oJMfQoXoU3ucAerz4K+are4
         s9VRAxhlh6HzMIvDh9pLX2Er15/DFmI17sfAoDBFVJUM/7JWxan4UxCoMEz0lQ3IuOMq
         9Bb7BtrTYKnxQf5MY4L5uHBRxf4HurnMVo6ZwS3ihr3tvb+CgLIk66UIrTI/m5kv//6E
         ztpUg07L+70jTFZfmKhWtUucbooRPU3VOmqiTW0QU/zAXu+Fgo3RE/xwgCwWHH+gYM0b
         bEPQ==
X-Forwarded-Encrypted: i=1; AL+hErFZzffRwP/HlAmDJz9nDfZLg5EScoZF7vX9FAcjvNo6Fw74VZHWg3vvv0b+XTk0PCXEy0eozEk+tFdGBkHMljY3@lists.infradead.org
X-Gm-Message-State: APuU4Z8GsfKM4FPkPWffpbGERt3hyAUgQGqJ6ZAWPJYuxF+70+SJPXdZ
	VHWCBGfQuWz2cD40TYrGp9cBPKB8P1pso+4qQcZHgRqTBv3MFvj6F97uGI6qAOYWNHY=
X-Gm-Gg: AZFdTZdvTDKguFZVobVIsN+S7ciSZmntq52A1rWvP/xmSXddhUFlEnoFswird+Re9ec
	LtJfckZqgmZr2f8Kjpfev3s3Us8OpqJQaPeHH2iw01E2T8Ym2U9Xnhh38WKcNjqb9fCIYI347a4
	5yyRtKgJfuIXHymWalD5zGPZZWlmg129UlQbEn64lRLDp1wR6GQJRL0Y1acRbLK1znqw/KoNosT
	eoJ0DpGF6Dn1pwOzlQEGlp3DFCsv72TIe8jmc+Q44XMfshUnJWYSErMMaAPC6DecWqLmImeGhcx
	8Lz2z+M/8nehUeejaBkOdRQRSk7mW67C/U2+JisvDrs5CcXQd32t10IBiRnpcbLVZbfttPzBNyZ
	Q0Ga3brymomN1uksdgq1WOQ3O6blJ4iFSOe5nA8URJ20o+tPa62JLgPx3gN7dVNh0D/eSjcz0Pc
	yX37jhIBthloDOsBFzCm4ssd3Lua7kUSJQHJpMcnOm3Iwe3ZxVT+4hyqAt9qvNRBNRaYSDphIYr
	JgtN+NcV8SWeW0yO56h67VUrhz9gzWRnMfAI/wgGSGHcfvQoAH/hqs+1lK+O8rY2IULjcbGThUK
	/UArbM4y4s7mBBzz0sEGJwGOz53IVA==
X-Received: by 2002:a05:701b:4555:20b0:190:8f72:445e with SMTP id a92af1059eb24-1b556877915mr12166436c88.11.1795413149986;
        Sun, 22 Nov 2026 21:52:29 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm23669790c88.0.2026.11.22.21.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:52:29 -0800 (PST)
Date: Mon, 23 Nov 2026 11:22:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: shyckless@gmail.com
Cc: krzk@kernel.org, peter.griffin@linaro.org, rafael@kernel.org,
	linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com,
	alim.akhtar@samsung.com, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] cpufreq: Fix leaks on probe error paths in three
 drivers
Message-ID: <awPUmsmWWBKdVUyQ@vireshk-B250M-D3H>
References: <20261123-cpufreq-leaks-v3-0-1f1e3f4f5a7b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-cpufreq-leaks-v3-0-1f1e3f4f5a7b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_215233_812587_98744B93 
X-CRM114-Status: GOOD (  16.52  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23-11-26, 05:40, Suyuan Wang via B4 Relay wrote:
> Three small fixes for resources that are not released when a cpufreq
> driver fails to probe: the cpu clock in highbank, the three clocks in
> kirkwood (also on unbind), and the regulators and register mappings in
> s5pv210, and its reboot notifier, when cpufreq_register_driver() fails.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> on arm (W=1, multi_v5 for kirkwood); I don't have the hardware.
> 
> Changes in v3:
> - Add Zhongqiu's Reviewed-by from v1 to 1/3 and 2/3 (Viresh).
>   No other change.
> 
> Changes in v2:
> - 3/3: fix the Fixes tags. The regulator and reboot notifier leaks come
>   from e8b4c1986efb and fe7f1bcbff91, and e0e5b2b4f427 did not add a
>   leak (Zhongqiu Han). No code change.
> - 1/3, 2/3: unchanged.
> 
> v2: https://lore.kernel.org/all/20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com/
> v1: https://lore.kernel.org/all/20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com/
> ---
> Suyuan Wang (3):
>       cpufreq: highbank: Put cpu clock if clk notifier registration fails
>       cpufreq: kirkwood: Put clocks on error and in remove
>       cpufreq: s5pv210: Fix resource leaks on probe error paths
> 
>  drivers/cpufreq/highbank-cpufreq.c |  1 +
>  drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>  drivers/cpufreq/s5pv210-cpufreq.c  | 12 +++++++++---
>  3 files changed, 22 insertions(+), 6 deletions(-)

Applied. Thanks.
-- 
viresh

