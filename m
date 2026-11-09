Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uyFqwUEV;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=lfiqO48N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DTYmFCEB465wYwuKSVWIKjqhbVZmXzLt8Fc+jMBonX4=; b=uyFqwUEVELW0Wt
	w1SmcV6Yb5aZ2D4GbvebNPf7pbNuWJUnxiw0I3vt+3CeruY4+Ef31VVRXfRcy1W45SFIB7xDNzMwd
	G/0B0s4wM0s7hvsYWKK2OvgLcapUhjk/QeKGGO/Y8aV4pz2hCy061WKWpvsg2TLnHJlIi7d60BYfK
	oMqI+2VwDTCk7ffibDzSJ1KkRdF4WiviwAlWg77Q1WtW2q7wiUpXE5ggsMtUAUx5njw3YqiT7mWRk
	jZVTLW+WpyyZF3DBKGFehX463XVAuBV+SGxmnajERyy02WnJhKdL7gLL4PCLwzpk6ba9F874cVTxT
	N13sUg9FmYztZgqH+mtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKcQ-000000002Hk-3xY7;
	Mon, 09 Nov 2026 08:20:46 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKcM-000000002HM-1GUB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794212442; x=1825748442;
  h=from:date:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Km96QfJf/xhJ8KPGePK7XEw/Gw/0Wp4vlIMbXoYhshU=;
  b=lfiqO48NZe8hxLwvg6ekhi/31E1CIHF++qoJrN6Rw8gkcX6Ea8ncEVnA
   /TqC07xzbFnrijyksM8q53nWDZr9DayAkk0nqZHzkMmyQjRBAXhTUhC+Z
   MSovAC2H8BopMC18+uAS3ujNIr1aMPeOXhW/bQ/XaJrl60SGFS9WvLDdq
   P/Cud1s2iArNpVel24dgjtej1hg8G60tqTo6ZUg0N4d6L0szpe3bhfKC3
   cynwng4OIBdzzFCaO8HP9/pWm8+4rRZVyrVO36kqYOmCGA10dhv/fCLJb
   eXoEcDQUDAHOqdklMGno0wA4ZB0jhlJr9fM1mVnfCQkvU3LwKdOgLi57c
   Q==;
X-CSE-ConnectionGUID: zH0g0F70S5WnZ8CNiiGMzg==
X-CSE-MsgGUID: kUgmhe/ISVW2LP4nll54Tw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:20:40 +0200
X-CSE-ConnectionGUID: lpKBdzlrSHqCfhnek4/bTA==
X-CSE-MsgGUID: hesYJTjQTs+s5JN1P6z40g==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 09 Nov 2026 10:28:33 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Nov 2026 10:20:38 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Mon, 9 Nov 2026 10:06:06 +0200
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, Ben Dooks
 <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-Id: <20261109100606.493ca48095bcc3527be18573@mobileye.com>
In-Reply-To: <avFzEaxgam-UuZH0@ninjato>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
	<20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
	<avFwLctRcnJHtINQ@ninjato>
	<avFzEaxgam-UuZH0@ninjato>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_002042_871355_7B4EE09F 
X-CRM114-Status: GOOD (  22.11  )
X-Spam-Score: -5.7 (-----)
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
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Wolfram,

On Mon, 9 Nov 2026 08:15:29 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > Testbots revealed a smatch warning:
> > 
> > drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success
> > 
> > I will fix it here.
> 
> Like this:
> 
> diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
> index 104da275ff91..8cf1d443a25c 100644
> --- a/drivers/i2c/busses/i2c-nomadik.c
> +++ b/drivers/i2c/busses/i2c-nomadik.c
> @@ -734,13 +734,13 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
>  	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
>  
>  	status = pm_runtime_get_sync(&priv->adev->dev);
> -	if (status)
> +	if (status < 0)
>  		return status;

There is another problem with this patch: 

include/linux/pm_runtime.h:

> * Note that the runtime PM usage counter of @dev remains incremented in all
> * cases, even if it returns an error code. Consider using
> * pm_runtime_resume_and_get() instead, especially if the return value is
> * checked by the caller, as this is likely to result in cleaner code.

I think we just need to replace pm_runtime_get_sync(&priv->adev->dev) with
pm_runtime_resume_and_get(&priv->adev->dev).

This solves both the positive return code issue and the usage counter leak.

Do you agree?

Best regards,
--
Dmitry Guzman <Dmitry.Guzman@mobileye.com>


