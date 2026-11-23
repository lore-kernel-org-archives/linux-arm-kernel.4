Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE88606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n49VnnhL;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gvCgsVCP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AgB/045LOM/DU0ZQ5PFtkUZFRoV3SsvyYBprk7gKsaw=; b=n49VnnhLATU27gFT3gNWyZTESb
	bOhGkOJBp+YtU20eelJzRhaNfZiEXFDS07WKHGeWK8bOGJO05du7PzPvyLoz/3bLWqbjC671Xm/0r
	LTUq2otRqVGwKezmZ8RR7kACTHL0XQlSZijzre6Zyt8AIsQXN8D5R+87krsr3MSCiq5dfOHbeF5oh
	QbKdNj/QuHgHR6GPg+mUkIQbVM45Uj6vYvc2WBYvQ/+YzBy9TLGpGcORkgARWJZt9Sm9XQuM2/hF0
	VphCf8ObpztHPvRAiV8DJ80F06XYOLsDqkEzVRN6zzfUNh8pabOSN/uHeaAjBixHKg+3OSDicWCOr
	nWvIAYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU7Q-00000003ZvI-2JDD;
	Mon, 23 Nov 2026 13:30:04 +0000
Received: from out-91.mta1.migadu.com ([2001:41d0:203:375::5b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU7N-00000003ZtD-1KKU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:30:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7IFxhjDe+u/lM8o/tJks4Z3OHLmd02D1xmAocD2YqLM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795440599; v=1; x=1796045399;
 b=gvCgsVCPFH0EdqjrYEvt5FK6XLfPr5mLcCWtidPex6WfORx2h2gqAKh4abgP2nPx9czfRSY6
 rryeyM9FSgUgkNXK0cQl1OVSzui65dB3rr6y8DPnMyaU/2mw0cDY6JSOvaXugVrwXmRI5ycJdGt
 TaXhJNP+6a42iNbi6LzcZfVI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 03467358e47fd2a5;
	Mon, 23 Nov 2026 13:29:59 +0000
X-Mizu-Trace-ID: 03467358e47fd2a5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so11106e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4lr4FzhQ7akb5VI8v9lO/AP3dFushncF6RWbGKryc2dv0K4JjnoTclmqYvts/n2HbwxM9WhcVtT+z0z8ewRM+@lists.infradead.org
X-Gm-Message-State: APuU4Z85h5+pz2qCjrch4C9YTfnTuwqOrpX37RVGgOqFgnSc/QdWQDDn
	pB+/xSLjzPINjwWeEQ1aRbHnYqfTQL3DT2HOx9IS49PFgLgn/RAmtfdl7B9DBKzzo+c2L8S+Gw2
	L0XlmOD320XN7UiRHrLmBASCrRFtLSpPbGNPbk+Ii
X-Received: by 2002:a05:6512:3983:b0:5c1:ac33:5a4a with SMTP id
 2adb3069b0e04-5c21a27a14emr207688e87.14.1795440596288; Mon, 23 Nov 2026
 05:29:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-4-fuad.tabba@linux.dev> <86ik1nzopr.wl-maz@kernel.org>
In-Reply-To: <86ik1nzopr.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 13:29:20 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxDGNLdKDRJF+uNg=WqxSqnm6aHtzXtCxFtgpCvgQQCkg@mail.gmail.com>
X-Gm-Features: Aa3M54qQFhLnTZaxFdOsvcgBtt8YqqV5Nj2yTBedsspH-OGSsxIcqI6DPQ-Yr-c
Message-ID: <CA+EHjTxDGNLdKDRJF+uNg=WqxSqnm6aHtzXtCxFtgpCvgQQCkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Zenghui Yu <yuzenghui@huawei.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_053001_505185_6B93B9F3 
X-CRM114-Status: GOOD (  11.88  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 13:01, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > index 6932dd0a02c42..5756ffe4ec13e 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -5854,7 +5854,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
> >       bool has_v4_1 = false;
> >       int err;
> >
> > -     itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
> > +     itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);
> >       if (!itt_pool)
> >               return -ENOMEM;
> >
>
> This one really wants a
>
> Cc: stable@vger.kernel.org

Will add it in v3.

Cheers,
/fuad

