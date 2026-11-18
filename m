Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBA2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s8GJAkQ+;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=A0PNf8EG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=07Hk40Tpzd0exU21rqFe2WaV4XF0cHbqrd9OCHEx29s=; b=s8GJAkQ+Ox85Mk
	SaOwmMV5iEvW1etXVR7i4XTKJwHj+Dmm6vdNW19JWmGGDCNW9NO+SU+ZhGscDTQtxJpyJAOh4OUpR
	gfplIhtItlzUKvMWoBBFnUqIMcqk5Z0Qo1+7QJbD3LAQtCaSdyvnxV1Dm4YgbvSAgnTyjfyLSyLTF
	GY/c1exiYGa9NliDFsllFedYYHM9uZp9PBVqB6puOr1Z79LTcwvUiZRIKBO/jHr088fJl6t45jbG5
	kSpoV+vkc+tT6rkVgL6ffgV27NfGK6HEevxZPGdqFTnp5z5kvyDpNdmwKnAIDz6r1rWp1WxIcc/Up
	Ngv6YiBvLj4VingcH8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTo37-0000000AOpS-2f1U;
	Wed, 18 Nov 2026 22:22:41 +0000
Received: from sonic-euwe1-0017.asd.mail.yahoo.com ([34.2.82.16] helo=sonic.asd.mail.yahoo.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTo35-0000000AOoQ-1WUR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 22:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1795040555; bh=07Hk40Tpzd0exU21rqFe2WaV4XF0cHbqrd9OCHEx29s=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To:Content-Type; b=A0PNf8EGpsyGv55j6FXHvQ+iIdclsGLckSUqutiiajr6W29ucpTLWPZJM3bfgwH54QvJc6P0xPeFuwdqGuXSdy7Gsrh2eAcAfZ57Ge9GzPxMAri1mYalZtCF3krgYR10UUityK0ZZ9wuD9NbMG3whKgIqSPuqpJth+QOkbf1RfVuBWQZMdcO9fOB6I6aF/rVpkoXJ2cHzWdl2RdE/2snu526QIBpQfl0I+l9+VCZMpEgqSlZn/Gu7wD8YUnUjGn82T1bdU7Qn2krsa9sHtouXWV5Ix73QigfQBwhXAM6zE8yYyhkENEcr0Sf6sFVJomBwAqHk3jpZmOcmAcrPHM4mQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795040555; bh=ccBSLLeMHNMCOjiTq3s1KL5ikKwzDgI3u7O26Fa7zeO=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=L/YNxzC5q/QkFHR6rTeMKVTXhP0uaRsloQw/f9BcmGA5innpu+CMjBNJhuXE0UQJ+7L735lylKRZnu3ICIkRzV+akRIHvJo4gZTidccNF354eR7IQAKSd8Mee1aKVIlx370jXWpbiAABXmgXrE9os0kiK3GaVaL9Gy9tSBgM9XwOdCTComaULdHPIekmaMq8KAoKxJjhKv08qoTl2xvfnHdeL3zDzag3XzkP/Zk/IMOOeywPw0yZFEggGMlUZ5BiMCaUzMv14DddbtAeCQEk03MMP8IEXNeHUjI+FeWCXQzrsQZSfsmhiD4j4RmYPZDkkg5Et0mz2mjj33bvbzjSYg==
X-YMail-OSG: E2zfUyEVM1liH8nrgR03BY6MMlnSLxTZiL4_OBke00d8BKt1HdeSS03_GrfkSqr
 r9GCOc9.sBOLMNOXYZjK4nMOtJmWBHU1ME5YheUvKyHBHSwtGUEgWtG7zaq1c6FNdezLuaLxA.Xp
 Yw3zGp2ZcmWE4pntiPfB6ZobFOYDCIMqSUP4wUrtDIgNZk__QG2cydAdDYWhYr3T4PlPg3Auk7dX
 PecEbRNaDLxXPcSVG3zd6HUWMVCzccr3IJayk6WXtYO9o3dHn_tdKDR5Gp80D3RmuoU.K8bVCkmZ
 78PrrACxbiDFQopx_yZZ_GrMiwfNCeeFyTitneeZB2YBc9WMCfR5bcWhResYxcknauhnxQnCLtdw
 4.b2pZG60ZC7cqM7.z0O.xDbZ4oeaz5hlAUHR2PRCvs.W7K5dAxfv4lJ2XB7QSZxLo3.ozCdRnjv
 K4bVWwWp0PrW.AZizoSKL6OF.i38BScvBNMWv2QZgB0hDqaxfZEuSuvJrRL6LEu8stZk4xvnR9xU
 Q.9EwD2P2eEYILkCucgbeVopluAfte2JWDyuxpgcIJybhhW4JhlH5NY4YGjG.HkheBQq_3ZV23Y2
 A16Tdhu6KTPxT8vtErjJh2d_SGkLehTL53Kd7NMJiw_MugeZgabadCiXUjTn1.b__kzvOnb5.aq0
 Cy3I.lWLr5u5Ob4iWd2_Gj2Fqq6QGHtdUh1JribzK548K7rJO4gjY.kX54bSO4Kr1m7hWIP6OpKy
 GwVJ27xsMtZZzmlS9KOZruP_xpiFx6wh0_7pjrHeaV16YG2qzixnVhV5Yvg4QhoVdRITSLJfA0_6
 YYpCgkPchhWoDVJqNI.tjOmklhaUpp2rDHVvFPIDqqG_HcmpHFJKRp1XN3xbjNwgLbdYWYyF9xGn
 2ZGy1QMoP7XH3rw1ZckxsavCPbkZKCvdGPe2bLAB.IEFM43KKzWD5ch76SobnEFv_4IeAWyPPINe
 2EAy9zNwOoCXDbSVZAw9_hQMreoHCy5ZUXA3pRnNB588xuYx4tDhJIbqqNz.IVEeKS18LvmEU4qd
 bbewjsO2fmBaOaslcOcwG_GJk9jDoG.UxwgiXWgrCtXU88jEOWbdEuMfca6V6bCoejBVS2Qi09bm
 rlFixmrRHH6OLx.5HCbFROnaKTn5qHCtptwJcjKYnBBbIzBxCfbH.pO5eoqg4tPz3t_yiA3u7gRA
 M9.G.KZIgAjOVBb8k0ILs3iTAKp_whkGcQOZDQDWSwQudtq2RjBpaKZzI1sMZwSYpE5lCTsw1F5R
 wmNe9qhYhdL2CpxU5rMOOraG8PEXtnV6wIoT7KbytqlOEG_67J5dIx5oZ_QRYVHAcShuFedKcSSn
 ihZjrob147ay12HRfKgNfv30Lje81TP0woEB0tgAjQQV0rxESgXgjYbuYrx0zD9e9uWKPiaPk1uU
 7e1jIM6SD_W9gmdesHdAgAw2RJ4TnmPBbtSkF8aTdJALodEYNU8hHzSrQ5jjvOYCeVStEiBy_L6W
 maJzYNVU2o_kk1YzXLINJT3Rq3Eo_4AbqI4.v.zHdvJHRtUU.xHbML1f2tOPsa_DK0bn0LeOhYHS
 _dvNJ20Oa6r3BZMAYnrd2ixmV3WaMEIhq9d13prdNmSvBd.By5jTkQ8Gne6ZmWX2WPg_A0fdNcNE
 hVP.Z0PTICyR6z_FxO0FJOsIFguVfYLOWzQNNW.why79tm6W4YQbzC3U1QsnFGV1LSoqGJaVwVY.
 daNdATXaSqglCV4N5f1JIXiWdJmd.XCK61e8yw1arqBmLSksiipY9b0PwC.6LWENZyzksqglRIi5
 dy8buFOCLAMXaULCIBKvBeYc3qbCEEImHI2h2Vd83cOTh7y0GFNhra93jRr9v2dkWoKDw2nEkfFa
 TghEdCMf8BLthrv7BBsVLj9.7Ca.iXaaNDNnQfRDnqf39ZPBhMg.fxfIrDQhIam9Yx2disLL84So
 MPGJ1fAZnFOPI3yf66YMaHDnUHu6mhqjLaom3AnJI23fN1yhruKj2QWazVjAy9bdqiE0AYhB8dHF
 dbeTLLDW6XjqRkM6uaIAJ7m9vOQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 0eafbce0-69f4-485d-810c-5d0ee321b30c
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-104 with HTTP; Wed, 18 Nov 2026 22:22:35 +0000
Received: from dip120.lsn.ir2.yahoo.com ([87.248.99.129])
          by hello (SMTP) with SMTP ID 97eb8e7d0ce49dbbcc92550550a7216e;
          Wed, 18 Nov 2026 22:22:33 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	dmaengine@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: bcm2835-dma: Add missing of_dma_controller_free()
Date: Wed, 18 Nov 2026 23:22:30 +0100
Message-ID: <20261118222230.123431-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <av3_yVSq9CKqix6o@SMW015318>
References: <av3_yVSq9CKqix6o@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_142239_548074_F787C629 
X-CRM114-Status: GOOD (  14.84  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:43:05PM -0600, Frank Li wrote:
> On Sun, Nov 15, 2026 at 11:15:15PM +0100, Tomasz Unger wrote:
>> @@ -1027,6 +1029,7 @@ static void bcm2835_dma_remove(struct platform_device *pdev)
>>  {
>>        struct bcm2835_dmadev *od = platform_get_drvdata(pdev);
>>
>> +      of_dma_controller_free(pdev->dev.of_node);
>
> use devm_of_dma_controller_register() to fix this problem

Hi Frank,

Thanks for the review. I tried that, but with only the OF registration
moved to devres, the controller entry is removed after
bcm2835_dma_remove() has returned, i.e. after
dma_async_device_unregister() and bcm2835_dma_free().

In that window bcm2835_dma_xlate() can still be reached through the
node. dma_async_device_unregister() has already freed chan->local and
dropped the last device reference (dma_device_release() does
list_del_rcu(&device->global_node)), while the channels stay on
od->ddev.channels until bcm2835_dma_free(). A client requesting a
channel at that point goes through find_candidate(), dma_chan_get()
fails with -ENODEV and global_node is deleted a second time. The same
applies to the dma_async_device_register() error path in probe.

Doing it right with devres would mean converting the whole teardown:
a devm action for bcm2835_dma_free(), dmaenginem_async_device_register(),
and devm_of_dma_controller_register() last, so that the OF entry is
removed first. That is a larger change, and
devm_of_dma_controller_register() only exists since v7.1, while this
fixes a bug from the original driver and is tagged for stable.

So I would prefer to keep this patch as a minimal fix that backports
cleanly, and send the devres conversion as a separate follow-up.
Would that work for you?

Thanks,
Tomasz

