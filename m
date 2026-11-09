Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3A1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X36Iua05;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSRdQUGq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ORer9DhCnuaZoXr0bk+u3MIlDvmVjzbI7uxg7VutLSY=; b=X36Iua05JELPAmI8EXMAQDLrfe
	q1HM5rDM4mTf8gI8+4PI8DBOlG5IWCgxVaf0Y2pDjYU0sOpVnF/1p5LMYPtp2t40lc0QKMxTh1oFB
	lwj5Pa8BaqwCf8waXIGh9DK3lCRmQnIGGEI89hiE43wiDh6TdzP7L9fBNx8sIB/VQQuAtDu+fpWgo
	lXq4mWq+lGglla35sYyLKtvNvFKn5BtkKvpxQY5h0LD/xkiyw1lCTIUfYMP76Njf7aCIo8d66CQ+d
	bbfS3EcDy2bzMotKD9LMJcFOI5HOobQIXDjnq1Wvs8G0/rm968L0B5XGkK/hQWbdQLRp0QLFyxESj
	y5WvUkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPWF-00000000p6N-0nlv;
	Mon, 09 Nov 2026 13:34:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPWC-00000000p5k-0hds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:34:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491aaed7565so538205f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231278; x=1794836078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORer9DhCnuaZoXr0bk+u3MIlDvmVjzbI7uxg7VutLSY=;
        b=KSRdQUGqGEho0DZvzP48LXXaCCwL+9olXe9yYVGeQWmtkM3mZuXC7Ra1VxqULZqHAx
         re8qJAlg8ceEK0yE+FbEggYqAItDnHaQ94vba8SKlROfc5lqppHQoaF6Wt44P1ehZYsC
         gVl70iDknZer6M+X+NmPOUbGOagU+oDrIGLNtRz5Ll4IWmgCbGoCNNf6ApSsg+qmFaUv
         I9XpjKB8CowArVyDBxgnMIkxqS8UvUFzTxaiCMP49uXzfzaZjCp9nYourFbjj/oKmTUR
         fB5CxLASL8fQGNSMg7jeRNoUnbLoO3mQpI1hbTNR6JB/liS5Z714k4Y7XQVD8BAFOM6q
         LIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231278; x=1794836078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORer9DhCnuaZoXr0bk+u3MIlDvmVjzbI7uxg7VutLSY=;
        b=iwD8FoUG8gSpL9RPpEOZn+kNgvsVzMk1YwXF43buJXGauNcztt3bVOoJMAy1hA2ahE
         a2j+jWMfH6xT6iWhD2dubcvUq/jg8t43rdkNwRmUPP/7RWPOH49W7+Fb55CSi/IX6u9p
         RJwqkLNx+3XKJ40qIX/5Uc8I1L6Ea01h6O8cEWdP4ZkRvKn6XybJSTnNvFTYtP878UyO
         GD50ktlnSj+7/BZ1XTaIvZCXuMx5rQlqPnoWwy9SBiSm+ChsNnWETAo+wCD7FxEWJBbC
         lwcL49eHL9U0cSAyOqMQPlkSBcKtXinp5sVPJm05+GYBukXxND+56S6B7Bg2H4atXSoD
         RU6Q==
X-Forwarded-Encrypted: i=1; AL+hErF5Xt8y40defmFW4FST2YLVgoF4gC614DyiG4RjQQ2Zx02ljAoMeMXMWsQfPfPCGJhSwVqDpaRhhMizWqffIj56@lists.infradead.org
X-Gm-Message-State: APuU4Z+j5gE8j7j5sYbzAFDiP6hJyEQLcFDgbxVMiR0u+puHEeZc+CCY
	rKv8xYZ4dQoV11HueRK+mFqhZ4ES+ugoxxs4JYoqxQ3E3aJKDDPZ/3Ko
X-Gm-Gg: AYBFou1/k/DxVj9fdIEeJ0ItM8D8BwBDdr+HWRgU9p3k+Ff+zcF8B2G4uQl9TyguEe7
	JymoFizxFRST64kpL7TqE37uYq5SHaAPO/g1onX38yoitIF4UNa9kuTwP+6TUL2p/DOL2bQTEV8
	cjOMVVjNVFMUrBEAjOPtXtFa7QyYnXQ5zgA0C0LxzORrwqrZpDSVhOK8Ny59xpHYGy7Fyb419X/
	uz6TD/Ok5Ho0l0gUXfkvNIGLCDc5faaeOIdnDv0vnnjUpB0ErJqAYms74uigJHHwcy1XUAsc6kp
	oBNyP5GRnu/uM9iuATPqzjeFy7mdv0BLnEhHE8Bztku8tti2stmSQaaMNNdZfQP/oUS945gOOHh
	YsJxlXtyctF4XewmKmnb+gWYp4RCxn3tyihralsWYrmv1Cx2Acp7wdZ0bgB8vs59ixvQ65f0X+C
	f7TCq8qxRyocZ/SEjRV7Vs1hmO/sYOaHazYgKZhgJTOBe9bi4blCqHJpZvqUor56hJoM7PSA+be
	jjodKxFfwyWev3RrK5JQfMmVKdyssFXwbil9QYZy7i4omZR/ctTxArnZAfEIV5K0Gvn4U0ZmQ7t
	Iiv3dwjAagWHcGY8J48olWqzJ4SvErAz7U6CKVvOm4cjvG1TQ1qYpyrZDBQq3O1Hn0XB4sUSAb/
	nqlR842WYss5ncu+6b+d2OKxqtg==
X-Received: by 2002:a05:6000:1789:b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-495829c1025mr7989710f8f.9.1794231277701;
        Mon, 09 Nov 2026 05:34:37 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.57.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39899sm9140435f8f.3.2026.11.09.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:34:37 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] KVM: arm64: nv: Skip empty spans when unmapping a shadow S2
Date: Mon,  9 Nov 2026 18:34:29 +0500
Message-ID: <20261109133431.185154-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053440_222504_860A2A78 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Emulating TLBI VMALLS12E1IS, emulating TLBI ALLE1IS and recycling a
shadow stage-2 all unmap the whole nested IPA space in chunks of the
largest block size, even when the table is empty. With a 48-bit PARange
and 4kB pages that is 262144 unmap calls per shadow MMU, each ending in a
range TLBI when FEAT_TLBIRANGE and FWB are available.

Measured cost: one full-range unmap of a shadow MMU takes 0.87-1.06 s on
AmpereOne (Xen on KVM, 4kB pages, function_graph). On Graviton4
(Xen-on-KVM, 48-bit IPA) a single VMALLS12E1IS trap took 1.46-9.50 s over
twelve samples (median 3.09 s), all of it in stage2_apply_range().

Patch 1 adds kvm_stage2_unmap_all(), which skips spans covered by a zero
descriptor at least as large as an unmap chunk, keeps the tracked unmap
for everything else, removes the guest stage-2 records of skipped spans,
and ends with the VMID-wide TLBI that VMALLS12E1IS requires. It converts
the VMALLS12E1IS handler. Patch 2 converts kvm_nested_s2_unmap() (ALLE1IS,
whole-VM unmap) and the pending unmap of a recycled shadow MMU.

The series is based on master, which already has the guest stage-2
tracking. It overlaps with the unmerged kvm-arm64/unmap-vmall work, which
defines a kvm_stage2_unmap_all() with the same name and signature; if that
lands first, patch 1 becomes "skip empty spans in kvm_stage2_unmap_all()".
As far as I can tell, that WIP helper does not touch the guest stage-2
tracking records, which this series does.

All twelve Graviton4 samples, in ftrace order:

  22) $ 2278347 us  |  } /* handle_vmalls12e1is */
  21) $ 3229689 us  |  } /* handle_vmalls12e1is */
  13) $ 7244813 us  |  } /* handle_vmalls12e1is */
   1) $ 2950198 us  |  } /* handle_vmalls12e1is */
   6) $ 5785126 us  |  } /* handle_vmalls12e1is */
  25) $ 2484152 us  |  } /* handle_vmalls12e1is */
   4) $ 2505404 us  |  } /* handle_vmalls12e1is */
  16) $ 1464441 us  |  } /* handle_vmalls12e1is */
  28) $ 1935604 us  |  } /* handle_vmalls12e1is */
  19) $ 9495486 us  |  } /* handle_vmalls12e1is */
  14) $ 4151658 us  |  } /* handle_vmalls12e1is */
  18) $ 9223579 us  |  } /* handle_vmalls12e1is */

Tooling: the patches were drafted with AI assistance (SiemensGPT).

Testing: build-tested on the master branch and
boot-tested with Linux 6.18.29.

