Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93D606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=klV4rXcV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Z0UzdlB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LR/ENSG1Oy0ZonFJqw+WDSGwM0wFAggM+KWeiz7ZDrc=; b=klV4rXcV6yK3l/sN78izMknxS8
	pmxO9gAmSYcyH35LhurdoQocNyZDtH7EhiN0NDOi4mgQKOhQm43jIUWrLaSx3wgMijvKPfkl2H/kM
	jAKUQDm+qvcmlELWamoalCxbQhcUZwSiHMzoPZMwr99BA9fAHYJBmpbdrdKS/kBMJIpoLDap+iaE/
	4IwVZhJMfXumnHmPvRgGToW6iFTXANsDyad5ScWrfNpDMfH03kXyTigUL8NdWm/PU2ExHO0S4S0Ha
	+UIz6XOzNfKT1iqBqCz1GNBgIsLjfBapTJY5D4E90e/6oiQijiPWnKfRiRBpyLoHqsuyB8cOcLLAy
	HNdsnlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3R7-00000003sv0-3L8L;
	Mon, 16 Nov 2026 20:36:21 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3R5-00000003suJ-2wmD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:36:21 +0000
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id T2VixSPUbVK9UT3R4x1AKj; Mon, 16 Nov 2026 20:36:18 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id T3R2xv1tCFhzrT3R3xb27P; Mon, 16 Nov 2026 20:36:17 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6afb6941
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8
 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8 a=mZs5ITWgARj6bgJpHwcA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LR/ENSG1Oy0ZonFJqw+WDSGwM0wFAggM+KWeiz7ZDrc=; b=Z0UzdlB+3hd953Y5/M8siTEDip
	lgctCrYmv6Ow9mBHNRoS2tETGaOcfQTQgQ95EZOflVRGaZdAsRI9YgBCDqsPbg1+8erYm8pgbE0W0
	N0JPEdoEo7kvOfGy3+dbFPE9sL2QkoNTaMgJIBuMgtg8Bfy3C/+VgLhEpcTKgz7eclfB4XRylHV2C
	R5FyFK9moofQKcLHC4kiU/MPcNNJmNWEhxrjbu81+wp6MxZrEzsD8Q1lveTeJ+oVyOISbFZSE9C4l
	uyRELnL1EJ8gNXu+nacu+v529orF5hlGjOMuexFc6+p6/8S/RgFQxJYmU7VIpodJBC9hOnldiSVAW
	mbqYhtVg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43056 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xT3R2-00000002IjR-0mCZ;
	Tue, 17 Nov 2026 02:06:16 +0530
Date: Mon, 16 Nov 2026 12:36:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] watchdog: stm32_iwdg: use managed variant of
 dev_pm_set_wake_irq()
Message-ID: <88ad5eb0-78a0-4ee7-9731-b04916307749@roeck-us.net>
References: <20261116190130.1191501-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116190130.1191501-1-antonio.borneo@foss.st.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xT3R2-00000002IjR-0mCZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43056
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPXumD6Ay56hJC4+B9zk06HmpsC547Q7a7Bh3FpMbEnrQZzcZR62+sB0v6JUPnExZ0zCdJrgx6QlO7Kan32G5Qt2BbsDLic6oR224kog6U/rMLza0AEM
 ckiHL7KJZ6c8u5IypiF0sVdkUQCD//EY7+axWPu3LmhFJUEtq0cvL24wp9JqI2sXD71zFRbJ0m3fx6Cs3Q5ZkKUqnbSCb8oicEousKv1Mfc6sr16JdYFRjrQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_123619_765972_9E136AF4 
X-CRM114-Status: GOOD (  16.79  )
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 08:01:30PM +0100, Antonio Borneo wrote:
> On probe failure after stm32_iwdg_irq_init() or on driver unbind,
> the struct wake_irq allocated by dev_pm_set_wake_irq() is leaked
> and dev->power.wakeirq remains attached to the device.
> Any subsequent attempt to re-probe the device hits the
> dev->power.wakeirq check in dev_pm_attach_wake_irq(), triggers a
> dev_WARN_ONCE() splat, and fails probe with -EEXIST.
> 
> Use the managed version devm_pm_set_wake_irq().
> 
> This is reported by Sashiko inside the raw log of another commit
> that touches the same driver.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/message/20261116132416.1184447-3-antonio.borneo%40foss.st.com
> Link: https://sashiko.dev/#/log/249869
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/watchdog/stm32_iwdg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a8d2db2d3cf8b..f1056f8100cf0 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -298,7 +298,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
>  		if (ret)
>  			return ret;
>  
> -		ret = dev_pm_set_wake_irq(dev, irq);
> +		ret = devm_pm_set_wake_irq(dev, irq);
>  		if (ret)
>  			return ret;
>  	}

