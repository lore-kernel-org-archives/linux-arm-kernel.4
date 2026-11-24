Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF0606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C7LcwtSq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OnSyYFSB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mTqCDhbQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wMv8ZWUVXzq+zwbayp1J26VPh+dF0lx+vlAOD4N7gYo=; b=C7LcwtSqqncuEmKCSO7igAHPc7
	UuKvfyyjhHQzaJEi4bqixtF9ugtD2Z2iMdu1ZZLdELmen9wWkgCAIA60maGIFN4+05chu9e2Qx5qG
	x0r7n0P8zCn8uCtciHpSvRrR+1yDwncCkoS3PYQjzdYtUok3miWQIn2W7WNqZ3/6iu8ktjrZgOtg2
	A6AWK/Ti5AQB4BASp+w+KFuVS0D8+lPnsgTt9FQaZ4rIbHZkBIKwvr8uPhrwgio1rZGXVYJOekVCG
	5NjX1Y6cKonfarr2zmYEw9siW8VMC4z4wVAZnUeeeoNtLSddeLz3eXX4gLE9uxPY3jjUBjN2/s4VR
	yXobIDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVte4-00000007AiH-2FbW;
	Tue, 24 Nov 2026 16:45:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdx-00000007AfX-0Dui
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wMv8ZWUVXzq+zwbayp1J26VPh+dF0lx+vlAOD4N7gYo=; b=OnSyYFSBJ+B0UdhbYTrcPBA3u0
	ZV8DOAPbLoD2dM0808BTSSEbsCeOqSzIdr2/e+sI4G/hRb6hSzix+7gJghnPtNnxHJPcssStBkmHA
	w8T6o8iqfwB9q1UBFqjUFmBSgeaz+Dc5vSaqldkxaEZsM5w0tO/1PF0r2Sxo6K3Oy/V2zHtzqUaO4
	DNsgavXY8Qj5mNykLZmRWZ1v+sRXLyRY/35RvyDwK7gWfCET3l/B6Omj2oa/Y8sNiy3ZWRA9o9yzH
	my6oyME4mXEGVNzdgVx6mChjalq1IieBZFXf3O4FzOI4XzFyscohsQ0JSbre4zsf9eRwIZpkWXL0/
	v4u11Nzg==;
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdq-00000009Db4-1fOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:45:19 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4bb8ae35aeaso39747275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538711; x=1796143511; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMv8ZWUVXzq+zwbayp1J26VPh+dF0lx+vlAOD4N7gYo=;
        b=mTqCDhbQ/5Y9W8yFhR69Uzaq9/QivqHl3bD+b8MLUrSu4jkP7aV5pVRo3/MyRT6b2R
         EBIefWuhvWA4hd9qQ6Z5o4DnLEcu/+HXLi9+LdEdXfpsCTxaY8i989RIObyJdE3sieJs
         gVkYwWDft00KGp9Jqfu7Bv5ElRBVr02KXSGNOht4Tm9W2u7gFXnlIyIssf3iSXjnfjM/
         HqHEfAMWy3e/FMOfyz3mXkfKeMtQ85fTIlPhbQahzbZKHtqDiLW5E9fuTBYFmYPBuvRk
         SNFY+25+rzBZOY+Nco74dAGQ7HTRDTuzvtZfzr3hL7XwlFh3jzTsO7/WHKA/TcfUn34k
         jgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538711; x=1796143511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMv8ZWUVXzq+zwbayp1J26VPh+dF0lx+vlAOD4N7gYo=;
        b=MoOF/YQuzCMg9BiRoaiF8SZMzSkntiBlAVjM7IlXV+qEQBBC68Cbjp0pnPOQRwk/W/
         d90A9GsA8YjK0P71/jq5P/Jwtigep0GYIyvAS8uUG/jQ6eu5vOLFj4TAUwb1ErBPbDhd
         0jmXmSaUZLnDHw1pNgUwDaYT376xhM9tYAaBWstOUGFvcFpEkshTTURwaceQyUDHQIel
         xYOfTsjNiMnuCRkbrHW0tMYsCt6BhlJUppA/BcPXpXx92Ok6d0419uS9/mqL+7hnqBgu
         YOFyOxIq/Ca2gq4oR3YX7PabYKlL8pmxUEZiL/MKER8D3In6D1IGijKQp1uEwmWdI3Lp
         hfug==
X-Gm-Message-State: APuU4Z81YH7nyYWTNnOcaAkPCrvaDUcrpoXcq+Ue1hWKIPHUZ8ac/zl/
	u6o8rUK0zb+yEIs0aGNkrvQ1Tb3zhisvS42Si/H6YZ4hEfvg2/VsyOOIdoMDVWbxJP1//7kYIZu
	E1yAsqZqvCaLWEdV1iXuNPQ==
X-Received: from wmcn22.prod.google.com ([2002:a05:600c:c0d6:b0:4a1:f1e1:c6d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr302032595e9.26.1795538711112;
 Tue, 24 Nov 2026 08:45:11 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:42 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-2-vdonnefort@google.com>
Subject: [PATCH v2 1/5] drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164514_475913_EE60E3E3 
X-CRM114-Status: GOOD (  11.45  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pkvm_init_hyp_services() is only called from kvm_init_hyp_services(),
which is already marked __init. Mark pkvm_init_hyp_services() as __init
too.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 26fe9c3f22e3..e7d7cedf7f6f 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -9,6 +9,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
 #include <linux/mm.h>
@@ -96,7 +97,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	return 0;
 }
 
-void pkvm_init_hyp_services(void)
+void __init pkvm_init_hyp_services(void)
 {
 	int i;
 	struct arm_smccc_res res;
-- 
2.56.1.809.ga0b61035b5-goog


