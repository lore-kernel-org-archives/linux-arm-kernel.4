Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RhlPCF84;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ROaEf9fG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wm4D2R2fUZcmyfdUwMn9Zrbt21Lpi8FA50NzkPSXeJk=; b=RhlPCF84gBrLkf
	66WqkjBtTfITHBk3ho36olwjV9o9m0OXJdZLUdSQ92ZFP7dtACbHfda3jhf06TdqIQy7jEfSpqasB
	0WY6oxwtcguioZmtlZ1gzqHL0+ibJ66sCHtVJtjsCT8aiFLJhe63PET6h2JohfI2/ldTK2I8jVELS
	IRs1dZCPfsi4j5k0OPQOSg7oZI5q5Qnk+jziKEqPsJl/hxkNfr3Seg+z2tYuerWHQTnkQofP1t96V
	90f/vfWaoBe3KET08HXTvrqhO0lNLBhEeM8nZZYOrpVVHx9MSEt7qVSIIIxKS/hgl6cNA24YYcYn5
	jyp0DfpotyD5v1jVWMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY3a-00000004OrO-1Ce0;
	Mon, 23 Nov 2026 17:42:22 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY3V-00000004Oq7-3f2g;
	Mon, 23 Nov 2026 17:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795455714; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=SwreKrU3R4DY5UQLmxROrMTAvJOzV/bwy1uuct9TMHcJUdUJpWZdG4gEz4KaLfNI5D/7ld90JoIM2A9iBDHIT2k8f3/56g4fwn+1SjuwLHw2MzOm2J2Kmaihy71CspObQaFmDHD3gyDbGqmkWMmnrw3JdsKrAI5r7FxyteusvSA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795455714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wm4D2R2fUZcmyfdUwMn9Zrbt21Lpi8FA50NzkPSXeJk=; 
	b=Zo6r7cdYaLdgg5Tn9B1qBjoHM0yvdYKpb3+YlXkId9vOgnFJyafJtPY3oANQpi7WOK+L05F1C/sb/XsxWZdRHYy+8nN6p7UO2TPYZM+OPnxQ8dkBreg9Lgw270p+QWWIF0B47Ho41x/Okkw+9v47gwxVxeUBRJb1qqPJ+eXBwjA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=ROaEf9fGu9dgnJESKk7Pq+FC/c3IEsHSaFpIRF6suDhiDwHvAsC7hdJ4NYMkH6AhU504mikDfbSfwu30qklszRLOEvphSa3SQMkFt7ewLIGi7BbvAEOIxnbCVIbhMAIWWw5hZfygAECqRgJZbUi1ZcPuflRNFR8mFOPGo8CxlK8=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Wm4D2R2fUZcmyfdUwMn9Zrbt21Lpi8FA50NzkPSXeJk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795455713979281.6369456863033;
	Mon, 23 Nov 2026 18:41:53 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime suspend
Date: Mon, 23 Nov 2026 19:34:34 +0200
Message-ID: <20261123-panfrost-rk3399-pm-rt-price-reply-1@iav.lv>
In-Reply-To: <a9a404e8-66fc-4595-9d14-7ab97cd08583@arm.com>
References: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv>
 <autNWETrwrHbD2H9@sobremesa>
 <20261104-panfrost-rk3399-pm-rt-larumbe-reply-1@iav.lv>
 <a9a404e8-66fc-4595-9d14-7ab97cd08583@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_094218_190238_7362524C 
X-CRM114-Status: UNSURE (   6.57  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 15:29, Steven Price wrote:
> Other than the somewhat confusing commit message (e.g. a subject of
> "Enable GPU_PM_RT for RK3399" would be clearer), this is fine:
>
> Reviewed-by: Steven Price <steven.price@arm.com>

Hi Steve,

Thanks. v2 went out a day earlier with the same code; v3 [1] is
retitled as you suggested and carries your tag.

[1] https://lore.kernel.org/r/20261123-panfrost-rk3399-pm-rt-v3-1-04c7c58d1140@iav.lv

--
Igor Velkov

