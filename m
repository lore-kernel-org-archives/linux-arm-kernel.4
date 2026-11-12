Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EU89QZQP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SyqcupJg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nzAjgOTLX8liwVDaIjjhbrB5TSRS945lQsicsDv648A=; b=EU89QZQPq/vgPlCKYIfS91DLA7
	m7wVf9+67XUmW3BMazDLwlDhYO2xXx8CwgX0faYc2hVgTFX2lW6K9D/p2NRsSZ8G6VCCcuUNy0j56
	tnTs4dG/8KhK3PKF+Xq5LHUCx2GJVLKXGHrW1oWL0XpH/oVTEOkqPfW5MCs1tbNz2uZ/56/4ITwn7
	7VFuullKNx9l7HXbjJ9rALIt5JAeKyXI6qQCBLTIUlQ0e0wt6V3xPD+cduSjCGeRYGPXrLzeVSbhY
	Z8X8/sImPD4NNg9TwdizIKUumNfMZ6zM5Rt573ou6RaqDKiWZ+8iNoSXvDdgYpfVN8Vv9nAxdqE/s
	HGECu6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROqA-00000008s0D-1uON;
	Thu, 12 Nov 2026 07:03:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROq2-00000008rzo-2zB4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794466991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nzAjgOTLX8liwVDaIjjhbrB5TSRS945lQsicsDv648A=;
	b=SyqcupJgmpLc5oz7gTth4ZVrreW43dYqaa+QSlE/RE0MCZqEnkViBaxvrqLclmpbPUV652
	b0jZMXslsIathje11Re+CrbefEEfyrVaJ9YE0Xlfdb9b6euLTWdqGMRqcs2319kLYjT67m
	pA4SFmj+m6xbldFZZPBoMKmhVaj7hdk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-103-J0lMeIM8NVahVZIby-0NEg-1; Thu,
 12 Nov 2026 02:03:05 -0500
X-MC-Unique: J0lMeIM8NVahVZIby-0NEg-1
X-Mimecast-MFC-AGG-ID: J0lMeIM8NVahVZIby-0NEg_1794466985
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D85019540C2;
	Thu, 12 Nov 2026 07:03:04 +0000 (UTC)
Received: from [172.20.178.129] (unknown [10.30.44.133])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1FF944D;
	Thu, 12 Nov 2026 07:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 6 of 54): Test report for for-kernelci
 (7.4.0-rc1, upstream-arm-next, 7ca48805)
Date: Thu, 12 Nov 2026 07:03:03 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <63309.126111202030500949@us-mta-103.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XeQwbfYEeUmH_dpsKhSfp2oGwFHDb3JZQCninQMIYmY_1794466985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_230315_041777_8ACE99FD 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: arm64: suspend: Save GCS state over suspend

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3056980048

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]
        Issue: selinux-policy: serge-testsuite: Client ioctl BINDER_WRITE_R=
EAD error: Invalid argument
            URL: https://lore.kernel.org/selinux/CAAUqJDt1pXQ2KVBvMoMiDrzz8=
ishonqhQ0nnQLEppot4nmv9Bw@mail.gmail.com/T/
            Affected tests:
                selinux-policy: serge-testsuite [aarch64]


Tests that were not ran because of internal issues:
    /distribution/command [aarch64]
    Reboot test [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


