Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ti3mRS1X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=F33svv/5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yFbIKxOtbGbhWSKxjVzud7YqnlnyHUxqB3yMV82sccg=; b=Ti3mRS1XDZWkuhxLBjpXTEtKbq
	TlvTZ6FQ6bWeRVq+PWm697QCYl9KVoJ64CBXsEhEdrauo83/aiN8zzUbo+1ybK1oZP+Rd5tSeP0Jq
	GWj2uAKvoBqteWK1uzW00thyXgG2yON6ZAUGD7INlqphYvvsoYpflWC1aQYEUX5LiqyOfzosPk9o7
	os3rf7KprTlzUQFp7Sq6ZQde0+giDEJMuV9hNubbanLwEp4pEwszoMxIBA5gig5FBg4oncK0+olmy
	pdW75fevM7jzVQvAzTONha76pDVJTHI90hw2yjkszaUxq9wn0n7gpg8Zld4U/dxh6rKLjhrdef1WV
	hh9uRsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAEO-00000001KpC-3i9N;
	Sun, 22 Nov 2026 16:15:56 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAEH-00000001Kna-205j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:15:54 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id V7oYxPxx5AR1iVAEGxRbZU; Sun, 22 Nov 2026 16:15:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VAEFx4niI0288VAEFxWbf1; Sun, 22 Nov 2026 16:15:47 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6b031533
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=xqVzBJ8tQ9rw--ji0ZwA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yFbIKxOtbGbhWSKxjVzud7YqnlnyHUxqB3yMV82sccg=; b=F33svv/5hnq6PbKGM9TkpeVuhX
	S27cSmSggZCyEea4kmQ8ox80WzzpLNqhbdRn7P8fr1jwTWCtwi80IzK3KQ4JFfn7HqgOIUVsTTqZ0
	SdG0Dy1u2yGCwsV8k7w4wXgElMZmrO4xNQ1BgE1gGPQvjC14O1BCnK6WQqVtuDZGvhE6O89h6WzDJ
	Mga35wHzjatLeb6ImCc1+zIESk8SsUEki3vOI6hLNBzGlVksd9jRqu3URTqB3IMBu8tdpy/+P6IEz
	e18WwLrK2vux/1Dt2okxKQ/iZV4aAZlYLNwY1acH3SgY0uJKG21JawI76KTY3l05za4ihWPA2hcAo
	xh8gJx3A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44242 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVAEF-00000002YAx-09Tb;
	Sun, 22 Nov 2026 21:45:47 +0530
Date: Sun, 22 Nov 2026 08:15:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Novak <artem122novak@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH v2] watchdog: bcm2835: add newline to dev_info message
Message-ID: <e9a71a95-3b8d-4e69-aefa-174446b1b19a@roeck-us.net>
References: <20261122082943.173681-1-artem122novak@gmail.com>
 <20261122102328.207524-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122102328.207524-1-artem122novak@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVAEF-00000002YAx-09Tb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44242
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC1dHsxQvs2DPLUdi0Dw7V+npsZZ4AKreAVMIxtoO9xIUtUEi2gSv24LMd3m+WVSO4Szjfr4UrlsxmnpwOaQuisZM6zfTR5kHHqBSVPAqhFEXCu+kBkH
 bioNZkoCJ0lDlFFB2Pw3FdQtvTWmfjnXdgb3rGdtikFw+dgvT+0Qb9rWOMoi01aqyRzrDSysLscHDsG+IOcmsP7bryq1uFIT72taJzNP0juZlDFueMgPNfsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_081552_918761_1369C770 
X-CRM114-Status: GOOD (  12.12  )
X-Spam-Score: 2.4 (++)
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

On Sun, Nov 22, 2026 at 04:23:28AM -0600, Artem Novak wrote:
> Add a newline to the watchdog timer initialization message so that
> the message is properly terminated in the kernel log.
> 
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Applied.

> ---

For future patches: Change log goes here.

Thanks,
Guenter

>  drivers/watchdog/bcm2835_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index 755954cbadee..df08236d2689 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -213,7 +213,7 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
>  					      SYS_OFF_PRIO_DEFAULT,
>  					      bcm2835_power_off, wdt);
>  
> -	dev_info(dev, "Broadcom BCM2835 watchdog timer");
> +	dev_info(dev, "Broadcom BCM2835 watchdog timer\n");
>  	return 0;
>  }
>  

