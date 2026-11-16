Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89358606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=em/+Gobz;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Narfx8JC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=amPjiGpOtCIdke4l/yrc8l6JZjZ/UtQMeu9AnP48ylI=; b=em/+Gobzf7TNqUUFsDeOV5uEZZ
	cPQ+LrY5IHQiZm4QbhSv1MDjoUZkBXht8o4pzaXgdUKRFSaPAPYa7NfMFNcunQZSi2s+5wENQus5H
	pfxGPXdaSQQNC/hMc2VLlmMzG1bc4a+EoD12imghtrgyWit4tf4jRMApN7mEclF3/ndkvXz5X+AeL
	1/Ml24n+/1jf4KWBudt8okiudFOJs47FvrTS3qWf1xbAfV9zMbsW7iTtJkUQh90reOrQrHi0OynAn
	EvO02XcUTZ+3MTOdWIeP2kn9blrQA3g5fS9FGSYfV8GUj8nAmGNcqRxKP8URHOzaZgYchHAmJ/nUu
	Qf8KIeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwmG-00000002dTF-0qjf;
	Mon, 16 Nov 2026 13:29:44 +0000
Received: from out-130.mta0.migadu.com ([2001:41d0:1004:224b::82] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwmC-00000002dRu-2Bkq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:29:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=g502higwqKmkBG0dlHtsxFQv+cbldCJE/40G3RLaxkI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794835778; v=1; x=1795440578;
 b=Narfx8JCqLfNINSV2qlr1aRmeBvBmS0mZwKeKFCzamE2qzpw7Nm34jJTyCus6o+Ysjypelo7
 trwX0cnmw7bDHeEYGmxQ947iIbvHtVPtop1sTAPyQFIvCR2zipcKK3QwQ+8uEVUegjM/ZO0oe05
 JD3hJZqcnaBzSEQ+owEC/YLc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8a5db24154ab639b;
	Mon, 16 Nov 2026 13:29:37 +0000
X-Mizu-Trace-ID: 8a5db24154ab639b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9999e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 05:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFJR0P6VpcbVieeW/9v2PyiwiGTtDOKpXf5eFgnvL/7dowr4MQPfHnzEcH3nK6lJmRrVsNBJv3DLcTCS2ZnH/Q1@lists.infradead.org
X-Gm-Message-State: APuU4Z8bRi9mjvqyBTEhRz1VobMT/Mc74dKtRMiY82J6/1CEn0KmvjES
	KRgx/XJOUiFWUilEW/j2oBOAJA2CfTswDvEVQRKwasfhadl6aR+NcFoEIY6Gk1QoBbTKp/LsarT
	JwDJI3YBnt/PRyRmNCIVVZM6J0MZj+0+S9rH/Pfmy
X-Received: by 2002:ac2:4e05:0:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5c17d90d3b4mr200956e87.3.1794835772489; Mon, 16 Nov 2026
 05:29:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
In-Reply-To: <avrzusx1g1ZICo0Q@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 13:28:56 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
X-Gm-Features: AclHuK8CwBlEBiyR4cPCR9dmkgnQ4XF5VSuwS8WKs9gu-GxXMupedl-FY3peK6Q
Message-ID: <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver issues
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052941_255103_747391AE 
X-CRM114-Status: GOOD (  20.65  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Mon, 16 Nov 2026 12:14:50 +0000, Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
[...]
> > invalidate have the same shape. The question is, can an IRS miss the
> > poll, or is a timeout here only ever a dead IRS?
>
> Thank you for your patches Fuad.
>
> The latter, though freeing memory on timeout wasn't a good idea given
> that there is no way to cancel the respective, pending, mapping.

Thanks, that answers it. If you'd like a patch that doesn't free the
memory on a timeout, let me know and I'll send one.

[...]
> > Notes:
> >     Setting L1 on every invalidation turns each registration and
> >     teardown into a range invalidate, both rare paths, and keeps the
> >     function simple. Setting it only when registration allocates the
> >     level 2 table would miss a registration that fails after the
> >     allocation, which leaves the level 1 DTE valid.
>
> I can't follow. I agree that we have to invalidate the L1 DTE on
> L2 allocation but that's a one-off, I don't understand what issues
> you are pointing out in the Notes above, if you can point out please
> the code paths it refers to that'd help.

gicv5_its_device_register() can fail after
gicv5_its_devtab_get_dte_ref() has made the L1 DTE valid, and before
the gicv5_its_device_cache_inv() at the end. That happens if the
EventID bits check fails, or the ITT allocation does. The L1 DTE is
then already valid for the next device registered under it, so that
registration doesn't allocate a level 2 table.

The patch Notes were about setting ITS_INV_DEVICER.L1 in that
gicv5_its_device_cache_inv() call only when the registration allocated
the table. In that case the failed registration never reaches that
call and the next one reaches it with L1 clear, so this L1 DTE is
never invalidated. Invalidating in gicv5_its_alloc_l2_devtab(), right
after the L1 DTE write, is the one-off you describe. I'll rework the
patch to do that instead.

Cheers,
/fuad

