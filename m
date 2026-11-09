Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B9A606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aVnAiI9m;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=eRmCzhFW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=; b=aVnAiI9mk0AGM8n/Ug08lydgZl
	jVYGNJFPYYJSFrySqC7OHB020f/0HvlEspzINwL6KKhf1vBC0po2cg2GZgylng/Eq3zH3gktNXH0m
	zp2DErPYSfowWwESjvBNDMiIQqZCWSLlC14lwC+BHrod8PD2LzX/ywoGXqhIsZ5JzCnDatuxnQ2R2
	0tbiDWg/+fIqUvx9QbsQr27pZHgAxJPhqUxS2lwtoiFiawO1xVeI8tuU02t89JfMzlAGYTna6OZgC
	/P0A7X6nDx/807yqYjNy38jbMjcnP3OYKEscACUXMJVXO5Ny4YTQYdSiYlCKCnRMkrZsk6L8DYCQh
	+zVMctAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUQW-00000001Uog-1m23;
	Mon, 09 Nov 2026 18:49:08 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUQU-00000001Ums-0ZKr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 18:49:07 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-533797e72e8so7273761cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794250143; x=1794854943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=eRmCzhFWMme7+BxVAhHZSfRMJ+nscQPZJEue7jDx4ROCPSRzcOcSRWk0NLa2v0j6V3
         5M+rpRuOXXA3btF5gv1anlvwIwxB6lmrfvW4E+aa4RTJ/0ak4eyjFcjdIraMKBe+vivs
         Tu/82Myx+WUlpQTru1aycoKo6wJbgLWGXXF8dDLt94sUNxqQtrtUW77aps4rTAjaNz+M
         z0yb65j6PSwXjeIZzvU33LIj76qeU4So9xp5crA6bTdaoZMEM0amI8wuZDBbJKyl3UbO
         ZPMj+0WH6rmoWWHjSbvZCaHH07ppNIqL0kq259w8m9qCGVJmymLjmm+C1rs0Asm71uPr
         5y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250143; x=1794854943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=l15Xov87l1+XlT69l9N+6zL25CiW47LbbWfahVYW6HSmM9MLa+v4shd0E6FvlGVLYJ
         AgNvVZNj/UFTBuKFome48rkE/Eoz6Ck1Wlc87Z1OhViA3FjQnCCquIqjgfs5oWKynNF9
         xynd9u4bHRR4zPG9Io/2qDbUoeyW4QgZ1RRGD16dpKXMULrifrpHDYVP7oSKaZ83Tn7J
         Xqfp+IZisyDYHx10rsgCiRQqqe3GR+HUX89B+xWJQYFUIVOgYDBwgbwhr74rGUSe+YOA
         Uqt/CTwmEGj2tAskCk6yD5Zm8SenOb1QenrqPA3yLUIzUM7SqlWZXe5gDFDHwb1XI4Na
         D3pA==
X-Forwarded-Encrypted: i=1; AL+hErHTFM25gOp3D++Euph7FIe20nyD4TH7zraZEN/gP4F9xQXQRa2jWyTq/h3CXOPBsxOZbecHdKuJBPPWWzoUlEwm@lists.infradead.org
X-Gm-Message-State: APuU4Z9q0o8pv0lMPP1qtC+pQChdzjtBarjew3ssUq8/W3k+Q4IyoWrI
	8G5Bs7DeSka6qE6nH69Htj78tp9JdUYkBH90H7VRKiimtHyAm+aLwclKJZvqmayBRbE=
X-Gm-Gg: AYBFou1DTYUhvTxi41lR5cB0EvN8dJmYj+kgUK+zTW12k55fv0l5SFdb2pHYZO3RYBK
	Zz2Jw1g4I6VCBiZOurwK4nN0L1/+5/A+aTZpdmSArcf4gRV7ICjhZQGjFtJOxIIbZ1TCobAHfb4
	1NXKvjtxvSFA1i/XILbcP5ktGb8vtxT4C2HPOMi9yLzhFYQB65285YwVfz72VHhQv/MEVpYTO7t
	jFfeoCeoDJ2Gafep+hsoCxNwxXBGY4CaSvtNrSuIqbxBDUFxtdiDrEDnEdbgHpj8otRyvgr73rl
	7d6ZkgadayilB3F3wEp1pNReMTmXxnWfblkN6/tKDMWY9Q6eshH6zKuXRS1GmOjzJKX9X7mWaR2
	5ymv5Cc5/8kZPtJkBEUEkYWnBU5EoGgPjHWq4r5OuntjsYLrb9VwY/RSqp7V40grYK4TxEpaJhG
	E+BSn3faUyUzfFtog9KvpKH8te+kqBoagQyJ60gDSyOzIBzpUFDY21EJYw6pQ21hb7TAFPk74Q3
	+j8pZxCARp+/AyBX0JhnWFO2EBbusL2gyUmw6MMtGTIJZgugKy+CaEzJ4L8AI4zO2g9BrWo+Ial
	UjtKX0eRSC5mb+l3Xz5NCHBADlJbJeatixxqMG7mlT6ySJxtHfwutpssKS8TmOM8DCB9qpLoDLQ
	3OvcC3j3r+ZOuebNM/7PgDa5QWpFcxSQ=
X-Received: by 2002:a05:622a:40e:b0:536:3600:f0af with SMTP id d75a77b69052e-555253df92fmr3996711cf.7.1794250142846;
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af60493sm3967801cf.4.2026.11.09.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQUQP-00000002A6b-35np;
	Mon, 09 Nov 2026 14:49:01 -0400
Date: Mon, 9 Nov 2026 14:49:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261109184901.GQ663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
 <20261105004934.GE3889730@ziepe.ca>
 <20261105091622.00004a9c@linux.microsoft.com>
 <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_104906_194302_B7EAC6CD 
X-CRM114-Status: GOOD (  27.35  )
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

On Fri, Nov 06, 2026 at 08:03:48AM +0000, Tian, Kevin wrote:
> > From: Jacob Pan <jacob.pan@linux.microsoft.com>
> > Sent: Friday, November 6, 2026 1:16 AM
> > 
> > Hi Jason,
> > 
> > On Wed, 4 Nov 2026 20:49:34 -0400
> > Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > > On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:
> > >
> > > > I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> > > > leverage this? Could PCI/TSM support this role without
> > > > device-security?
> > >
> > > It is certainly not what TSM was originally imagined for, but with our
> > > new arrangement, yah maybe so?
> > I will rebase on this set and send out patches for a detailed review.
> > 
> > > TSM basically just becomes this weird overlay driver on the PCI device
> > > that does stuff. Some of the stuff it might do:
> > >  - Register an attestation subsystem device to do SPDM
> > >  - Register to allow iommufd to create a viommu
> > >  - Some status sysfs ?
> > >  - ??
> > >
> > So we may expand pci tsm to have more than one role? currently it has
> > one.
> > int pci_tsm_register(struct tsm_dev *tsm_dev) {
> > ...
> > 	roles = is_link_tsm(tsm_dev) + is_devsec_tsm(tsm_dev) +
> > 		is_assignment_tsm(tsm_dev);
> > 	if (roles != 1)
> > 		return -EINVAL;
> 
> Not sure what'd be a proper name for this, but it sounds to me that
> it tries to over-abstract something into tsm. The reused logic related
> to assignment or viommu is relatively small, so the other option below
> sounds better if it can work.
> 
> Or it may be the original provider framework that Aneesh proposed,
> so tsm/MSHV/pKVM can each register its own backend...

That is definately undesirable for TSM

I think the very best answer for this is to get the viommu from the
"kvm" fd, I just don't quite know how you implement it..

Maybe just register something like a notifier chain where the struct
file * and the viommu type value goes in and a viommu object comes
back out?

Jason

