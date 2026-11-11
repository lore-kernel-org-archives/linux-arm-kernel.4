Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001E606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gGESMRx0;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FK4bA0DW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QOSdSglx4cYZzRZ4bFEyEb3urAnm38JHFMwpeRnni2Y=; b=gGESMRx0meLRBNyeUN3X/O+drO
	V8P8STO4/A+PwssnpdHuEDwChpfAgaLGJ6FbfUQBplfwKITC3Pwwm5LS0xNRhkJnpq44p3pC3oke6
	OrW2Uga2CB/tozxQhPpHH1CgeWEJtoT0pElY/H9Ncj9OcQX10MXPnpxMyoW/rxK5M4y0TNluf2Xo3
	zav3XSnglEX0nAJ5+RfMWksl5TKzFqf0MB97cfAxwd8oCcfyXjTgVQdnsXwgEVyiultF6rnAbXRSL
	tuU5jXcSGDQX4cKU2GdkT5jLDI4jY7u9K+zOvV0iP3fvD79y6s7uualV9H29u/SEN+phljY1ioawH
	tMyhdmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Yq-000000069g8-2sTT;
	Wed, 11 Nov 2026 09:24:08 +0000
Received: from out-30.mta0.migadu.com ([2001:41d0:1004:224b::1e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Ym-000000069dL-3PW3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:24:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QOSdSglx4cYZzRZ4bFEyEb3urAnm38JHFMwpeRnni2Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794389042; v=1; x=1794993842;
 b=FK4bA0DWF0BFMjhlDb7efJk4cTnliYuxifSxwOSO1huliFRtDuF1rBNCBljssGOdyY67lOs/
 l5aiVI2266f2sbjfzdbVMOV6OyGps8zFCrgL6YLAwjqQInlK5RyPJ97yTisSCXYOuwLObEIVzAx
 fq2MuJmK+2EuRXpEosijKUV8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e982230ae9d8e30a;
	Wed, 11 Nov 2026 09:24:02 +0000
X-Mizu-Trace-ID: e982230ae9d8e30a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so2083e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:23:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEgPVugsuwWOuqgaEVxfSKZLmtdKYj5XX7B501xQcXmDL5yXMmh/iF3hQu2mUEdgF9kmJFmmcHLpoahWjKraozT@lists.infradead.org
X-Gm-Message-State: APuU4Z9i8u7D/8KNTI/NRB+AEumbyA4p7gminFEUc3nSdkxwOULGFYTK
	EDoBA27hfepnSE0T7tOD+v6/MIznzmIX4b/grPtXdObeCD9xosQ0K248cCVbPo8b5jIyCqodZEh
	ovfLDT6aJPEiXGdF0q2PWPMebJtkgGUWqQ6PZ9gT9
X-Received: by 2002:a05:6512:1391:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5c15d3dbae9mr114690e87.3.1794389037704; Wed, 11 Nov 2026
 01:23:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106092625.3977163-1-fuad.tabba@linux.dev> <86se1720q9.wl-maz@kernel.org>
In-Reply-To: <86se1720q9.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 09:23:21 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwGV8FD7vyfxBa-e4EiOML_K7ROzUhf8VXabDZX8BPQRg@mail.gmail.com>
X-Gm-Features: AclHuK8YpE-etUaFU4_mpDfSZ-JZDBrhj85FH0V2Eyh_IMXGfrpvKSpXE5qT9p4
Message-ID: <CA+EHjTwGV8FD7vyfxBa-e4EiOML_K7ROzUhf8VXabDZX8BPQRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3-its: Fix the ITT pool's alignment,
 zeroing and growth
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012405_134570_ADC1F3B4 
X-CRM114-Status: GOOD (  11.69  )
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

Hi Marc,

On Wed, 11 Nov 2026 09:09:34 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> How does it relate to the series you posted right after
> (20261106120221.347309-1-fuad.tabba@linux.dev)? They both deal with
> all sort of zeroing and allocation requirements. So why isn't this one
> single consistent series?

When I split them, the other one was a single barrier patch, a
different fix from the ITT pool ones. It became three patches later,
and those overlap with this series.

I'll send a v2 with both series in it, and reply to the other thread
to point to it.

> The scatter-gun approach you keep using is really becoming
> counter-productive. I really appreciate the effort you are putting in
> fixing the code, but please realise that humans are reviewing this,
> not an AI. So please make it at least easy to track and keep related
> things together.

Yes, and sorry for the noise.

Cheers,
/fuad

