Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F0606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 23:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yiw5jToO;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eBkU3cF3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lNRE3dzCBxO7nm4VMU4oDCTynVoerROwU/BbSnJuNlE=; b=Yiw5jToOESfPvhuG6zu25/kYuP
	f31+fmg8n9US17scxC080Sw0QIXB/ukNTdyQUtfxTSFfOc01TxXCEJhsOKoXTq77PhSWnSS1izMcp
	yi3iW4EZFNlonjMJsq/3OpWC6cwV9VzXvcXwp59vsfdWOHD8DLwT1UqcsO1UmKf2JgWdtnHVb86G/
	Z0n1sZ5EU+JZE/9QlnPuqIq1HaT3AIp4cPWeQ6b01D+KudTrjhVZ4EYX2omDj23ClVMcv4L5oy6dP
	9Wrphd+jm6+VM9GBv64NifhSwS3NVZcFK+SmMF16zV3S8IO4XN+NC29KaoGENrQmu8OXOPmtUTWJ/
	ZMROgK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0Hh-0000000EmCh-054a;
	Fri, 13 Nov 2026 23:02:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0He-0000000EmCN-0ESB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 23:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794610931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lNRE3dzCBxO7nm4VMU4oDCTynVoerROwU/BbSnJuNlE=;
	b=eBkU3cF3fKiyo0aJVD+CQgadCvxvs0iERsuiSrvfLdjKN7dH6O758QdDY85+s8AUpuKvfC
	T0VtyHXxo8XDD1Ur+Ep/l0kanyqVEpC+oDZ1vmWCsIrkW2iUTidUrX0aw7axylYokyG/xT
	8qsxXYw4YkPq1uPoYZ8yS7HO7QRD9Ss=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-o7-U-iHYPV6P97HDgVbocw-1; Fri,
 13 Nov 2026 18:02:08 -0500
X-MC-Unique: o7-U-iHYPV6P97HDgVbocw-1
X-Mimecast-MFC-AGG-ID: o7-U-iHYPV6P97HDgVbocw_1794610927
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC0C01956064;
	Fri, 13 Nov 2026 23:02:06 +0000 (UTC)
Received: from [172.20.178.129] (unknown [10.30.44.133])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 009261801977;
	Fri, 13 Nov 2026 23:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 6 of 54): Test report for for-kernelci
 (7.4.0-rc1, upstream-arm-next, ad3fc05c)
Date: Fri, 13 Nov 2026 23:02:05 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <22657.126111318020800437@us-mta-464.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v46RMBRCRGTfupPIwhnmn_clEyscAn1yTq9Wsi03jgA_1794610927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_150214_263898_FC081752 
X-CRM114-Status: UNSURE (   6.82  )
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
    Commit message: arm64: suspend: Only track cpuidle context for idle tas=
ks

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3066219150

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


