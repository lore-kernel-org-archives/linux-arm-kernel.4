Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B0606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z0TmXWhk;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bMd6+LJw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vPrQKAr5VJH4BBI1lFBcxcIpYXfnW30sT/Vt+7Z3g8s=; b=Z0TmXWhkLkfqxX
	y8rzJ9rkOTJhebxwL7DG/24esIjgjsciIU6dFylVwqrUprpmbc+e7byczt7tlzvfzvi0aLohypvY9
	4tY7Y9pIisQ21Xq2dRoOxvH4boESV48ySlhEi2MErrQrtIkVyEQzin1opBt3l6px6CTzprlZWUYIL
	xGVPGxCFtHGN9QrijBNMuI1tQWnn7kK+YWMw/K9Gfg6L4O0GXC0AOmmgh8N7kTeby7y3dRqJBG5+Z
	Dj9A/UKM7q4xliOBSWqTMCbMPmciePlrRIvdN1DM2KzlX+4pZ3D2tGCww/P2VFFSn8hYS5HPPg3hK
	fCwlYowmMxjJlFpdCrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4W3-0000000FHsM-3Xu8;
	Sat, 14 Nov 2026 03:33:23 +0000
Received: from mail-qt1-x861.google.com ([2607:f8b0:4864:20::861])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4W0-0000000FHqU-1wMw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:33:22 +0000
Received: by mail-qt1-x861.google.com with SMTP id d75a77b69052e-55c35262674so3529481cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627199; x=1795231999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPrQKAr5VJH4BBI1lFBcxcIpYXfnW30sT/Vt+7Z3g8s=;
        b=p+9da8FUxXue8siYXvR9PTXboSiMt206bS3YsTn0t+Juc6yRFIC08jcHLwtDh8HH5l
         ISgRfgp5+nOLCSe3yREnOBDzQp4GvaSc3sUdrCuKSCVLAWR4FMu7jUolsNbDyI8YP4st
         +NJ0pmr9zl93aYEbNp9B7gOnUfi7UZ00cypKL1v/52cqmhLHCnM9CNJ7hzTQ6YUionVZ
         1t7IKPFN1uoHXranqkZiNi5wtkt922Io9FfUg9omQEVyjlWTld9eJEEOvxw6EaxClrzy
         o79YVaO+3rWn78XDF/enXkNG/R11AMywilx+j1doDh3xEfkUdVeIbZ3aNADNIaN9QfkD
         7xBA==
X-Forwarded-Encrypted: i=1; AL+hErHS7is34Mif2nEUdZoNZwdFFa96R344tCl+SPsnQQzvT70OK7X9V2Lmi6chmFWWJ22v0m69KuEJLlH+yINQRY8B@lists.infradead.org
X-Gm-Message-State: APuU4Z/Pc4uoR21rZpNdivEoeDMSBfyis+Pp/kuIXEItjyx4nj3x1IMO
	A9y1LOkz8bDCyN9AtUFFLWH4ZWQ5h0enFWaU1ttqCPhYsrcnpnLJbZnrIgWyE550pjwgVR1OvZZ
	F1sOi65Fchg4DSGtSl/YamuKYCWESmA6A1JmecGADfSLHuwuy6anvmIaqJtmSZzkRHcxGeRSpwi
	vYiDCSOTNI/7QpH4IUlCngfJ0aLKqXDGh6lCPti9i8aF/uwXmoh7AryTTkK6rnoY2O5ypLtIQ28
	XWCzaSBCtmGSpvYvjLF12G80q289nleq98=
X-Gm-Gg: AYBFou2l9NrvG/3OPqh6pX01szSvefmSnCOMeplUSfHSwGnA2Q/5DXX5qhLZhgFSvQG
	Mztefef88ef6tcHP7cLF+cG9K1UgO+HRPWFbCBLaxYuFMpRrmE3N1XFgm4zDO2Bq6LxVbcgVhDX
	e7S8PkXgUE5Lkm1thXUlrpn5UAVEVjl9RqfuHkqkmV0nrS8OTRGOe4TCZWRFNk5onJgHez09bKp
	MVu1B3l2B5f5w3nEP2MWHhk2IyEir2P4N/dsZuQLdswLkVm8yCSGI29OKNOA+UEnRRwPnZqlw92
	tavWtc2b7MoSdn7gKws1ec64jwPlREUTDpHz4yBgTiUBcLb04yg7YFqnMwnNJ4Bzj7HCWdxWN3O
	fmTtyKkwWrJ0CwyYdAuFr7MPJqdXskepmb9ZSDyd1ipd08MG/7VjGrX6g5J8btAP8pOwSMe4V/C
	Vab7Qxx4mTo4phHp6hM3VjURCSSfek+G2h0pP8kgdyg0M=
X-Received: by 2002:ac8:5d91:0:b0:536:52e6:fda9 with SMTP id d75a77b69052e-55ac828113emr71568181cf.32.1794627198947;
        Fri, 13 Nov 2026 19:33:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55ad220e922sm1216141cf.53.2026.11.13.19.33.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:33:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7019278eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627197; x=1795231997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPrQKAr5VJH4BBI1lFBcxcIpYXfnW30sT/Vt+7Z3g8s=;
        b=bMd6+LJw0vdeizznCpPIbtQ+xHYL9nUpg4BBALvGKcLuOqGGSGrwKqpQCBZR4DNrdm
         w0mFeOKi4pdPWBm1NHTzwl89x+QHmm8nIuXboch6hbJJNpr3nPtGRhm8wFfM5MsqZwjY
         j7STNRYIKGW1wDzxF9W1OQueCd8tASqLBfVog=
X-Forwarded-Encrypted: i=1; AL+hErE95vgax3pLtOdfGE/EsoiAwU2PC72kJOI5rZ/Ujl2bzk+DGpRu3CFvt3C6tF4usO/DnSI3XOnWYMShuXHdN/ao@lists.infradead.org
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr4956817c88.32.1794627197445;
        Fri, 13 Nov 2026 19:33:17 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr4956781c88.32.1794627196818;
        Fri, 13 Nov 2026 19:33:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm21906906eec.20.2026.11.13.19.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:33:16 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sander Speetjens <sander.speetjens@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] firmware: raspberrypi: Add bcm2712 revD compatible check
Date: Fri, 13 Nov 2026 19:33:15 -0800
Message-ID: <20261114033315.876198-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102170227.1719206-1-pbrobinson@gmail.com>
References: <20261102170227.1719206-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193321_154071_C0984156 
X-CRM114-Status: GOOD (  10.81  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  2 Nov 2026 17:02:24 +0000, Peter Robinson <pbrobinson@gmail.com> wrote:
> The bcm2712 revD doesn't contain the base SoC compatible of the revC
> because they're not fully compatible, we need to check both else we
> don't match for newer devices and the RTC doesn't get enumerated.
> 
> Fixes: dba67294e2151 ("rtc: Add Raspberry Pi 5 RTC driver")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

