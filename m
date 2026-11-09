Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A71F606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XsRi1DdQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0DcBLZr/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IiHfMjI5UW1C+sBrl6OK0Tos0QEXOpbHcV5EoY3XjNc=; b=XsRi1DdQWEGWXZs8hrn5FsV4gh
	8g1VExWGYIDlu+zyZ85FdgbzgYfrL3je9fkjoVY9fUdp3V7IeHpu8yOYKdS4WmttapevA0+KCDtjw
	xNCXKLHHZ552xYi1PR7kf12vfVLbAM2iWPbEjBrqaSFk45Uc6oTdXrzMxECBWNgScIkw9JOpjr8bi
	Om0UFvxdSCnU9Hk6p+SSYVsOFXTU8kKmg76C1m8MigfCD80XC5mGmBlsxXU6y/pp0b6V2RSJ89d+F
	EPmS9La18+OCuqkNCiuFz5/M50PakM7NIkZWJTiSIN8MXlwrFlTBLhH7FZqWG+kl2bJDrntWGqeZF
	pnV2o+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRjv-000000015qB-2D7d;
	Mon, 09 Nov 2026 15:56:59 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRjt-000000015pX-2Fky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:56:58 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id QMAVxVcqlJFmFQRjfx45o9; Mon, 09 Nov 2026 15:56:43 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRjex8Nqf0288QRjexd2wc; Mon, 09 Nov 2026 15:56:42 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af1ed3b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iHwBjlyiAAAA:8
 a=VwQbUJbxAAAA:8 a=bbxMUrBqG-LWPQ326wMA:9 a=CjuIK1q_8ugA:10
 a=uNSKXYNwxGiU6LD0JREI:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IiHfMjI5UW1C+sBrl6OK0Tos0QEXOpbHcV5EoY3XjNc=; b=0DcBLZr/Skrac/9YuaGppdAFJq
	U4CB7I9WuAnpZlpf5NUrjQGth5l+jsEH1ZZW7/3kuHf/CI1Lp1/3mOZDlnxB4GCnQZYfrQON1aFeJ
	r1cgrB6r23EF/MUjM+b3QUfIi/HqGMotIs//Xrn5CGhx/Rh7JnSIb/+kUuXskx39f8f4Ut83tfE8k
	u70/v0zPbLBLic59c6WLJy4LLGi74o9UTIBOghgeO6zBoo2osWPwOk2v3Ttf0yFSAd0BTuzgVlGz5
	J16JZAT5a8P++Mr+xrR0BKI4bov23ZvgBgKXD0XgMfmFM7QOIvyoWE1no2KLsdo5l0YhVy+glJ4C+
	LI0w7RUg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:32976 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRjd-00000001UbS-33TR;
	Mon, 09 Nov 2026 21:26:41 +0530
Date: Mon, 9 Nov 2026 07:56:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: raoxu <raoxu@uniontech.com>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
	marek.vasut@mailbox.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable temperature sensors using their
 sensor IDs
Message-ID: <25506328-5bef-498c-8e9d-00c33bb8b13f@roeck-us.net>
References: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRjd-00000001UbS-33TR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:32976
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 37
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIH0BZZJx2/L9ua5lZpT3Co7ZoS/2zd8WioEW066Sz8o7LY0KcDD9rND0S6FAELCGvn1SvUGoijwI4j6hlBuBlBKo9tXrI/oVRPs0c8RYG8IL/4ua/qV
 mHFT/UVnUPh/3Jew1JwXblGW/nzzfmuXq9rMXCyAVcCsLkB5K1oQq+X5Srj/5QqtyOUJ3MlG84+SeBs7YZx+vUvkinwjYV7hdx7wuR4621o+qU78zxMCFlDT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075657_637661_FFA6533A 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 04:28:54PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> scmi_hwmon_probe() groups sensors by hwmon type, so the index in
> scmi_sensors->info[hwmon_temp] is not necessarily the SCMI sensor ID.
> Passing that index to config_set() targets a different sensor if the
> platform exposes non-temperature sensors ahead of temperature sensors.
> The intended temperature sensor can remain disabled, causing subsequent
> readings to fail. If configuring the wrong sensor fails, thermal
> registration of the intended sensor is also skipped.
> 
> Use the firmware sensor ID, as the read and thermal registration paths
> already do, so temperature sensors are enabled correctly.
> 
> The patch was reviewed and the commit message expanded with OpenCode
> AI assistance.
> 
> Fixes: 72804d1631b3 ("hwmon: (scmi) Enable sensors to assure they can be read")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Applied.

Thanks,
Guenter

