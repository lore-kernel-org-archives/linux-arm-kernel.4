Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53431606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZvqlGF7J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=imRhrWj9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XaNxNGEs8cACYJ1K/c/IGhLzAXT/1C+t0RC4e7xy6jI=; b=ZvqlGF7JjZayv3C9rPGf5VIvsn
	BiVcZ+EaxrZJMV4pLIV8cSN7Y3/hX3N2xd0ZeO188lYXxulx4TsV/16sDuYp0iWa4qMpp7wLfk9aL
	BB+LwqENPAY2Zx2Xd+WRpWolIaOse57uqbpWyjG8K11HIX/GD5Za3Zwxgt7cnSYPXB6fCIk1yWpjB
	yiZd2DhKx0XvUBiSVxJwv3aGjMNIivnZ8IX6PGDoOlGK++3TwXjZd4UHfFfvqAfD0K+gB/PSStNN0
	svsC8BVCbgkmanRrobAl/0VphHr2tdMHBYoF4ohIFF0D5S+WBPiDHIj47xmQ6rqeiSIInHRclew2L
	piyuj0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYuf-0000000DEeF-1L7R;
	Thu, 26 Nov 2026 12:49:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYuc-0000000DEdf-1t8O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795697355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XaNxNGEs8cACYJ1K/c/IGhLzAXT/1C+t0RC4e7xy6jI=;
	b=imRhrWj9G7Rp9FrZlMVoobG4uUTQsugWGgRDwUBIGGOKONOVB4JHnP67mGbqSqhz76dULz
	iPTuZMTSAzqYPNHxkPsxPtWsEesbNNlGPom6U11zJyUiv91znu4M+5Tc6V9AezVEiHy7XR
	hvMtrxkvxb+90GheOxAdvKPhzAJpBko=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-T43cQlV9Nzy7hOD_uxtUnA-1; Thu,
 26 Nov 2026 12:49:13 +0000
X-MC-Unique: T43cQlV9Nzy7hOD_uxtUnA-1
X-Mimecast-MFC-AGG-ID: T43cQlV9Nzy7hOD_uxtUnA_1795697352
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAE811800349;
	Thu, 26 Nov 2026 12:49:11 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 17F6C1956086;
	Thu, 26 Nov 2026 12:49:08 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: kristina.martsenko@arm.com
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Thu, 26 Nov 2026 13:49:01 +0100
Message-ID: <20261126124901.1690779-1-jhladky@redhat.com>
In-Reply-To: <lnh4ij6zpo5haddbkvxjp2gui6xlgjzaxkrmh26xgovc2b3muz@2wapkzpfnceq>
References: <lnh4ij6zpo5haddbkvxjp2gui6xlgjzaxkrmh26xgovc2b3muz@2wapkzpfnceq>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: TDuVEjqqQyCrH1sWzR37hMHYoSlfhl2yyoTjrSznjAg_1795697352
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_044918_633374_03C83D42 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

Hi Kristina,

Thank you for the review! Good catch on the path: the diff header
was missing the arch/ prefix, a scratch repository layout mistake on
my side when generating v2. The code itself is unchanged.

v3 with the corrected path and your Reviewed-by follows as a reply to
the original patch posting.

Jirka


