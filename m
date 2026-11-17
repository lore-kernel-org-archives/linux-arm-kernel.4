Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D48C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j892Jjjr;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hz4olVyK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e/0455aVSKf4ZqTvdu8SIA7Syq8Dck34mc+Lxs2NK9Q=; b=j892JjjrIeBD4i
	0hT3UFB2+iTOcNxDDDo4HK0J5R4fdagRpv6b37S4jXMuNoHaN8Y+Vez3SeejpYnXtXVs320mm44+7
	XjMNd3UNVkI93XWbEYoeGuWX4eSg13X3DE81E+bABlGLgGl3LC785X1BPy/+n1HPNrAvP0araNThp
	rOd89LcEdyuwmamufbWVarPYi1oR+DY1yJAZrZcJ5VUXulQYzgmpzNp+lkV+7HNk9YDoubg9YNHfH
	kUo5RoBep/KE3t5DLAQ5/SAFDQlxGPHFwHAvPZmlKoz6QfilFmF9x1eW/oNsU+hfkEb2OzFI1K08q
	JjPvUOty51Rwx5hei+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR0B-000000079vx-40jo;
	Tue, 17 Nov 2026 21:46:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR06-000000079uw-48cu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:46:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so9592645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794951959; x=1795556759; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/0455aVSKf4ZqTvdu8SIA7Syq8Dck34mc+Lxs2NK9Q=;
        b=hz4olVyKg1UMovzP6BIAWqt81u6KB65aeLXZkSeAKK2zRRxtwPT0y0msGlthJfDjhN
         TK5ua4uzI4V/h3HAifp+7t9s0fw+RUDZ2L0cIYqCAv77LTEo2uKjYyVq+yoN+4ABFRLb
         Kp6wWJqm2lYFwD7E+S+7aAFAWirguvpyXU72XDv70F6UGy/jDyttJJX1/ALQ94f13dbi
         c5TjlKfkLDw9I+lCy2M8ScOz3Xh2icHXp9Av4VqSRtVX4QOg3xN2S89CzQ+NE83O1cJk
         7trgiY2nHtxIi8Q/1z/s42MI/AoniBJg6Ax6ZQlVXs6/KzJG7CkkmtVB09GxXNE9YsZj
         4/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951960; x=1795556760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/0455aVSKf4ZqTvdu8SIA7Syq8Dck34mc+Lxs2NK9Q=;
        b=w+pRtaFTwyXGIGyDO6QAiceinjqrNAADUdLQN7RrSbkFdHiPCG4lZAG2Wwat92k077
         i79lMO3vfZm3/ntOhst76xWKGPznlQFj1dmLh7K5I4mjN5lE2+gmpubI9OtO1XKXjPpe
         2gv31QtVO20da0vkWajgIQ2rwQXwOWZfn4whmOAdK5gSBhJqbqLo2QZowNNG64HEPklp
         iyflDNZLyGXIacNtCQkRwodIaQG7WT2Owy8RE6mRLadvRD4gfan1nWIEnBSdT8gEk6gw
         U+OsTngn/hM2Cfr0kK2C1TudhfrtdbnH3BqzvSbpUgiYzq0Vn6LQfkeUV5H2hi7sbGBM
         qXXg==
X-Forwarded-Encrypted: i=1; AL+hErFcYVs2EQGbIL7/WFhe8/KY1olilZ4cLeS5h+IbtC7pElHnPa3dU3UXMcopdW+51AOT9jxqJxT+Kakirdm6omll@lists.infradead.org
X-Gm-Message-State: APuU4Z+b1XdHgk76ffRn/8gFsvP4Z/kWrNx+w07rW8w5trQJohmhLj7T
	XtSBUPxnU4Zk3noNppVPNq8oijtLOUA7jqc88txbUbeXQ5p+zg2u5X61c7O9f7hjaTI=
X-Gm-Gg: AYBFou02le1o9xrBETpTWCj+xmWQsfxBCU+jlK7WgV87ruLhH8utFPUlPcUIRScKyVw
	x6gTdapnXwJ2udUuy/7iWNjKe/sfkmrTXiyymiyxIshIlf5iN1ufrWsDz18ugnuw9frwENINpNZ
	XgvSMGHTs4opJ0Aa0w60KcLBztzD/uEz5yUrNearF0efIuqPnRPv94xzvuyAseghcLxFWmfrjjl
	az54XTxQJqLeDoVRB5lUp9V1Mp6BlgX0+1on23NlIz2Q3y06vF5Hx9Ym6LvBcel+M7/V+razrh/
	dV5NZ4coLhpwR4t6gAIjRm7eUosjEnCZ9aqQHk9JBsUKx9p7RX3JxwceO3GMlfHy/UGcAJDZ1tt
	ZQmsQVrm1Vghp0RprMNDDTmicSAZtrYwOqBUqv8iLjKraDT9A2Q/4lItU8ejSo0Z+/rl9Hkb20U
	unyr4tz/ccbfBA2uyksJ4SB67nPNfn9m7bJHzFIdngNPSCIZDlaofUJYFVcwq7YHGqBG7fgNCQZ
	487rwVMgcXijJzOyimLr2mbBQIb4sGTD6KAtqBzvDAq4v8MYeo1fqORv8LEyT/EC34BSXRtglVY
	NnyMYqtJj1M7If4xF1NNbbHTp4TLpWH06/S4vxzpGkPOCuikDqyDc5RlIfOtFZTjnKXzn7tEOEl
	u7c4=
X-Received: by 2002:a05:600c:a54:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb7da30033mr10977415e9.15.1794951959287;
        Tue, 17 Nov 2026 13:45:59 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm15648465e9.0.2026.11.17.13.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:45:58 -0800 (PST)
Message-ID: <39614a57-c375-4bee-bcea-f0ebd2d0b572@baylibre.com>
Date: Tue, 17 Nov 2026 21:45:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] accel/rocket: Fix the IOMMU domain leak in
 rocket_ioctl_create_bo
To: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-2-kernel@airkyi.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <20260814022453.437-2-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134603_044329_030748E0 
X-CRM114-Status: UNSURE (   7.68  )
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


On 14/08/2026 03:24, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> When rocket_ioctl_create_bo fails, rocket_iommu_domain_put should be
> called to avoid an IOMMU domain leak.
> 
> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Daniel Drake <ddrake@baylibre.com>


