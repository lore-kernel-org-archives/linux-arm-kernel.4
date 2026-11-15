Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD1606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sj6EYNY9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyZP0FMu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g+uoEVaY7o8GGV6KPfzfE+Dp0fwtZ6vxaUTvxsle11g=; b=sj6EYNY9jdQJ/7Ie9qR0NEmSuo
	jxNNNWntFodhfa7yUpKUsq4ThLGayVZ1tOLWRqlJ2PijgqLL60DqWRRChm0w8ayRFMoYAM9a5M6JY
	n650XgPIk35h6oii8utcVtwnM8NCmESTYrOgx8MxKvGsKY/wX3RVZsfhwTP2sb2vyRvt2CvElz4nB
	tWQH+aLrGgpjz2mzhiZh2T4cg/rX+LF318xXbZCbjlfqIHiM2FWpZSXz/hrHTpjmrQHrrKNwhIdoL
	4TTKBK4rwFaW6B/de88cT9Qlbie5v9D+VlucVsiJgvdgBUtV+VF/P+k1r3+VwQELfP8xDQ7W8c7XQ
	Y/1lfE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSihe-00000000dfA-1cqO;
	Sun, 15 Nov 2026 22:28:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSihb-00000000dee-1Ynl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:28:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ed1414df17so13964075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794781678; x=1795386478; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+uoEVaY7o8GGV6KPfzfE+Dp0fwtZ6vxaUTvxsle11g=;
        b=EyZP0FMuksaFTa0YS83I9Sh1a7sIzloTHVlCgT3drzzaUuT6lPbanD+VqA5OpTLZxX
         IhroS1oZHDcjACsewR02cbkmgIg3kknh0Xz+fKcrh4GofodFxp34rXEMvY6qKcO4i8pG
         l9mnmzFxAaVzx+HEmQYj2/qmSyM8S/sWXXexFqnxdVW4kOD/o6h12e2kJe018+IQCpV9
         QTZPBSYP+JvKFg8qbTNbGsZWK24PDu2AhzQDkkeWkgddxeQ301tbEBNqW8jGzp7+TlOe
         N3XFGYr2FfOQy3EFvbm/N+UNVUL71u0zjXrKTRB51n0Ya4PEGuMuKQCE9PVc0AmT/muk
         eFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781678; x=1795386478;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+uoEVaY7o8GGV6KPfzfE+Dp0fwtZ6vxaUTvxsle11g=;
        b=lXfcAhqk7DoAjRfJ2kaY6hfoGC8rkcCmk8i9gAWNIz5pBUFlFD1zBdGAvfdMR9/CbA
         xcHGK+qWyvD0s6TwUr0+X6svCPvbBL5JP4HSdP7ElN/LZF0olQZNfFlLek5qqVB/jWa9
         UbjRGQAfA/NqH1SXA/lnZxoShML5ELh7DMGRZCNER53CnpodXY/vYw1CGyUzED4dSyIQ
         6ZTijDMPu/kS2p2NBy0Y4Hx66dTEcpnNBhRLO5dJYl9R3gxRVFIB5wMjfO3BGIVLAJH9
         66DR3siKDcUN3R50+BPYWrK57f2s6fxw7p9QQ7r7neqf8DqRAf0KkJnTXF65OcC5nFwd
         pwxw==
X-Forwarded-Encrypted: i=1; AL+hErH1xHw1/mbrZxn9LEajarv1M79ZVn0sf+qhOGPSH+8X5iMrHAQQVvfzqa9vG9tkr0SnKJsWFujGGqDCE4WG7Nv9@lists.infradead.org
X-Gm-Message-State: APuU4Z83XrWv3PIP5l/Z/ncrRss8ngTTJiqTJcHQ/UcK2q8kFd3jZorq
	5K2KmpJCcQTlRzZP+TyWuBDpASIrbPrcw4DxsxkVeyb359oOOiODcI6R
X-Gm-Gg: AYBFou1gOjEZ/7ysY/DHXLcQ0eoPEctiIBkXcktaC+tOjF4JlazaYbOiwPVAIjnxAfR
	9S4/7T7WMkTWK4CtXrrhKr1SQOWHQqH09bULJoVhGbB9ULMRYP6Wlaqx430aembf03jPPEQ3J3J
	vbrUqkIOb/1PmbzLkCvnelPbH41//mhdFakJSQu/+zu4KIVsGK/Dw5jot7lq7jdQR94204m3sTD
	PziYVAEWNS2T3TQv8aAGMgc2eIby4lw+QbqjoOj1fLkfZxdbi7aqJ2Tw4G/E2rtUl2kquwYh+SZ
	OwRE6L4O5UVev9i6GcDVKA9mCCXH+jqy4NBM+atcf9ZAlkMPpL8qHzzqPMVgCZUQn4kza6xIEMW
	K3EiMjtJ5RhKbSk1PwCDfdGCV95xEfJ6pQtNXu/KuKrTOc/V+nzmWhEz2WvXtrBlOrkIH4dJNO4
	nBiMIqwgU9daq/VweQEaTyM43JPHSeT2XUP/8ZCU8lVuNgKONa1siO6IJkeVwPqhWpa0vro3QUW
	YK05TJuWESTaj2LmsQ2v3VSn3Kn0VE3tPDHQfGJ5zL/Ngia7tnlCYaOIskdUWzvgFducGOLx/n+
	zHK3+FhPqrSbPAjk2I6CRc4Wf/NWd3UywvUhwK9eFQbs17ftCG+xpnQk6+q7dtJ+G2kmbdgvcld
	dPdAkiM1CoCyEmw==
X-Received: by 2002:a17:903:f88:b0:2ee:2557:4069 with SMTP id d9443c01a7336-2ee255742c7mr54507105ad.23.1794781678304;
        Sun, 15 Nov 2026 14:27:58 -0800 (PST)
Received: from [192.168.35.214] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa27c23sm28191145ad.71.2026.11.15.14.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:27:57 -0800 (PST)
Message-ID: <e1298d8c-7b10-4552-9c6a-9418e8e26329@gmail.com>
Date: Mon, 16 Nov 2026 07:27:53 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] devfreq: Use mutex guard in governor_store()
Content-Language: ko
To: Jie Zhan <zhanjie9@hisilicon.com>, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linuxarm@huawei.com, tianyaxiong@kylinos.cn, zhenglifeng1@huawei.com,
 zhangpengjie2@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com
References: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
 <20260729102348.3857779-2-zhanjie9@hisilicon.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260729102348.3857779-2-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_142759_418540_6B4676C1 
X-CRM114-Status: GOOD (  19.47  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: chanwoo@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 7/29/2026 7:23 PM, Jie Zhan wrote:
> Use mutex guard in governor_store() so as to simplify the locking logic.
> 
> No functional impact intended.
> 
> Reviewed-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>  drivers/devfreq/devfreq.c | 38 ++++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index f08fc6966eae..7a70dd051644 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -1394,23 +1394,20 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	mutex_lock(&devfreq_list_lock);
> +	guard(mutex)(&devfreq_list_lock);
>  	governor = try_then_request_governor(str_governor);
> -	if (IS_ERR(governor)) {
> -		ret = PTR_ERR(governor);
> -		goto out;
> -	}
> +	if (IS_ERR(governor))
> +		return PTR_ERR(governor);
> +
>  	if (!df->governor)
>  		goto start_new_governor;
>  
> -	if (df->governor == governor) {
> -		ret = 0;
> -		goto out;
> -	} else if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE)
> -		|| IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE)) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> +	if (df->governor == governor)
> +		return count;
> +
> +	if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE) ||
> +	    IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE))
> +		return -EINVAL;
>  
>  	/*
>  	 * Stop the current governor and remove the specific sysfs files
> @@ -1420,7 +1417,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>  	if (ret) {
>  		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
>  			 __func__, df->governor->name, ret);
> -		goto out;
> +		return ret;
>  	}
>  
>  start_new_governor:
> @@ -1438,7 +1435,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>  		/* Restore previous governor */
>  		df->governor = prev_governor;
>  		if (!df->governor)
> -			goto out;
> +			return ret;
>  
>  		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>  		if (ret) {
> @@ -1446,7 +1443,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>  				"%s: reverting to Governor %s failed (%d)\n",
>  				__func__, prev_governor->name, ret);
>  			df->governor = NULL;
> -			goto out;
> +			return ret;
>  		}
>  	}
>  
> @@ -1455,13 +1452,10 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>  	 * the new governor, restore the sysfs files of previous governor.
>  	 */
>  	ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
> +	if (ret)
> +		return ret;
>  
> -out:
> -	mutex_unlock(&devfreq_list_lock);
> -
> -	if (!ret)
> -		ret = count;
> -	return ret;
> +	return count;
>  }
>  static DEVICE_ATTR_RW(governor);
>  

Hi,

include/linux/cleanup.h includes the following comment
"148  * Lastly, given that the benefit of cleanup helpers is removal of
149  * "goto", and that the "goto" statement can jump between scopes, the
150  * expectation is that usage of "goto" and cleanup helpers is never
151  * mixed in the same function. I.e. for a given routine, convert all
152  * resources that need a "goto" cleanup to scope-based cleanup, or
153  * convert none of them.
"

A Patch should be atomic. This patch still uses both guard and goto.
even if you removed goto on patch3.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

